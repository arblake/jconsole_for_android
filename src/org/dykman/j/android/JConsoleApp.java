package org.dykman.j.android;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.dykman.j.JInterface;
import org.dykman.j.OutputListener;
import org.dykman.j.android.Console.Dimension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.AssetManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.util.Log;
import android.view.inputmethod.InputMethodManager;
import android.widget.Toast;

public class JConsoleApp extends Application {
	
	public static final String LogTag = "j-console";

	protected JInterface jInterface = null;
	private JActivity activity;

	protected Map<String,Intent> intentMap = new HashMap<String, Intent>();
	
	protected java.util.List<String> history = new LinkedList<String>();
	protected final String tempDir = "user/temp";
	protected File root;
	protected File currentLocalDir;
	protected File currentExternDir = new File("/sdcard");
	private Console console;
	boolean localFile = true;

	List<EngineOutput> outputs = new LinkedList<EngineOutput>();
	
	boolean consoleState = false;
	boolean started = false;
	
	public void setWindow(Context context, String label) {
		Intent intent = intentMap.get(label);
		context.startActivity(intent);
	}
	
	protected void addFile(String path,Intent intent) {
		if(!JActivity.JCONSOLE.equals(path)) {
			path = new File(path).getName();
		} 
		
		intent.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);

		intentMap.put(path, intent);
	}
	protected void removeFile(String path) {
		intentMap.remove(path);
	}
	public boolean isLocalFile() {
		return localFile;
	}
	public void setLocalFile(boolean localFile) {
		this.localFile = localFile;
	}

	protected void flushOutputs() {
		for(EngineOutput eo : outputs) {
			console.consoleOutput(eo.type, eo.content);
		}
		outputs.clear();
	}
	public synchronized void consoleOutput(int type, String content) {
		consoleOutput(new EngineOutput(type, content));
	}	
	public synchronized void consoleOutput(EngineOutput output) {
		if(!consoleState) {
			outputs.add(output);
		} else {
			flushOutputs();
			console.consoleOutput(output.type, output.content);
		}
	}
	@Override
	public void onCreate() {
		root = getDir("jconsole",  0777);
		if(currentLocalDir == null) {
			currentLocalDir = root;
		}
		jInterface = new AndroidJInterface();
	}

	public Console getConsole() {
		return console;
	}
	public void setup(JActivity activity,Console console) {
		this.activity = activity;
		this.console = console;
		this.console.setApplication(this);
//		setConsoleState(true);
		flushOutputs();
        if(!started) {
           started = true;
           StringBuilder sb = new StringBuilder();
           sb.append("1!:44 '").append(root.getAbsolutePath()).append("'");
           jInterface.callJ(sb.toString());
           installSystemFiles(activity,console,root,false);
        }
        setConsoleState(true);

	}
	

	public void launchJHS(Context context) {
		String arg= null;
		if(!testJHSServer()) {
			JHSTask task = new JHSTask();
			task.execute("");
		} else {
			arg = "ready";
		}
		JHSLauncherTask ltask = new JHSLauncherTask(context);
		ltask.execute(arg);
	}
	public void setConsoleState(boolean n) {
		consoleState = n;
	}
	protected String[] getHistoryAsArray() {
		return history.toArray(new String[history.size()]);
	}
	
	protected String[] getWindowsAsArray() {
		Set<String> k = intentMap.keySet();
		return k.toArray(new String[k.size()]);
	}
	
	public void callWithHistory(String line) {
		addHistory(line);
		callJ(line);
	}
	public void addHistory(String line) {
		if (line != null && line.trim().length() > 0) {
			line = line.trim();
			if (history.size() >= 100) {
				history.remove(history.size()-1);
//				history.remove(0);
			}
			if(history.contains(line)) {
				history.remove(line);
			}
//			history.add(line);
			history.add(0,line);
		}
	}

	public void reset() {
		Toast.makeText(this, "resetting console", Toast.LENGTH_SHORT).show();
		getjInterface().reset();
		console.replaceText("");
		bootStrapSession(null,"''");
		InputMethodManager imm = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
		imm.restartInput(console);
	}	
	
	public void newFile(Context context) {
		File tmp = new File(root, tempDir);
		int i = 1;
		File newf = new File(tmp, Integer.toString(i) + ".ijs");
		while (hasEditor(newf.getName()) || newf.exists()) {
			newf = new File(tmp, Integer.toString(++i) + ".ijs");
		}
		Intent intent = new Intent();
		intent.setClass(getApplicationContext(), EditActivity.class);

		intent.putExtra("file", newf.getAbsolutePath());
		context.startActivity(intent);
	}

/*
	protected void preserveCurrentWindow() {
		if(currentEditor != null) {
			currentEditor.markCursor();
				EditorData old = toData(currentEditor);
				String ol = getCurrentWindow();
				windows.put(ol, old);
		}
	}
 */	
	
	private void _saveas(final FileEdit fe,final File f) 
		throws IOException {
		fe.setTextChanged(true);
//		fe.setFile(f);
//		fe.setName(f.getName());
//		Log.d(JActivity.LogTag,"writing file " + f.getAbsolutePath());
		fe.save(f);

		/*
		windows.remove(getCurrentWindow());
		windows.put(fe.getName(), toData(fe));
		setCurrentWindow(fe.getName());
		*/
		activity.setTitle(fe.createTitle());
		
	}
	
	public void saveAs(final FileEdit fe,final File f) throws IOException {
		
		if(f.exists()) {
			AlertDialog.Builder builder= new AlertDialog.Builder(activity);
			builder.setMessage("Do you want to overwrite " + f.getName() + "?");
			builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
				public void onClick(DialogInterface dialog, int which) {
					try {
						_saveas(fe,f);
					} catch(IOException e) {
						Toast.makeText(activity, "there was an error overwriting file " + 
								f.getName() +  ":" + e.getLocalizedMessage(),Toast.LENGTH_LONG);
						Log.e(JConsoleApp.LogTag, "there was an error overwriting file " + f.getName(),e);
					}
				}
			});
			builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
				public void onClick(DialogInterface dialog, int which) {
					dialog.cancel();
				}
			});
		} else {
			_saveas(fe,f);
		}
	}
	protected void doCloseCurrent() {
		/*
		final FileEdit editor = getCurrentEditor();

		if(!(editor instanceof Console)) {
			String cw = getCurrentWindow();
			windows.remove(cw);
		}
		*/
	}
	
	protected void promptSaveWithAction(final FileEdit fe, final File file, final ResponseAction action) 
			throws IOException {
		AlertDialog.Builder builder = new AlertDialog.Builder(activity);
		builder.setMessage("Save " + fe.getName() +"?")
//				.setCancelable(false)
			.setPositiveButton("Yes",
				new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int id) {
						try {
							fe.save(file);
							if(action != null) action.action(true);
//							doCloseCurrent();
							dialog.dismiss();
						} catch(IOException e) {
							Log.e(JConsoleApp.LogTag,"error saving file",e);
						}
					}
				})
			.setNegativeButton("No", new DialogInterface.OnClickListener() {
				public void onClick(DialogInterface dialog, int id) {
					if(action != null) action.action(false);
					dialog.cancel();
				}
				});
		AlertDialog dd = builder.create();
		dd.show();
	}
	/*
	protected void closeCurrent() {
		try {
			final FileEdit fe = getCurrentEditor();
			if(! JActivity.CONSOLE_NAME.equals(fe.getName())) {
				if(fe.isTextChanged()) {
					promptSaveWithAction(fe, new ResponseAction() {
						public void action(boolean state) {
							doCloseCurrent();
						}
					});
				} else {
					doCloseCurrent();
				}
			}
		} catch(IOException e) {
			Log.e(JConsoleApp.LogTag,"error on close",e);
		}
	}
*/
	public boolean hasEditor(String name) {
		return false;
//		return windows.keySet().contains(name);
	}

	public void callJ(String... sentences) {
		JTask task = new JTask();
		task.execute(sentences);
	}

	
	protected void bootstrap(Console console) {
		Toast.makeText(activity, "booting session", Toast.LENGTH_SHORT).show();
		bootStrapSession(activity,"''");
	}

	protected void bootStrapSession(JActivity apctivity, String... args) {
		String argv = "''";
		if(args.length > 0) {
			argv = args[0];
		}
		String home = root.getPath();
		StringBuilder sb = new StringBuilder();
		sb.append("(3 : '0!:0 y')<BINPATH,'/profile.ijs' [ ARGV_z_=: ")
				.append(argv).append(" [ BINPATH_z_ =: '")
				.append(home)
				.append("/bin").append("'");
		Log.d(JConsoleApp.LogTag, "initialize engine: " + sb.toString());
		
		if(args.length > 1) {
			String [] ss = new String[args.length];
			ss[0] = sb.toString();
			Log.d(JConsoleApp.LogTag,ss[0]);
			for(int i =1; i<args.length; ++i) {
				ss[i] = args[i];
				Log.d(JConsoleApp.LogTag,ss[i]);
			}
			callJ(ss);
			
		} else {
			Log.d(JConsoleApp.LogTag,sb.toString());
			callJ(sb.toString());
		}
	}


	protected void installSystemFiles(JActivity activity,Console console,File base,boolean force) {
		if(force || !checkInstall(base)) {
			InstallationTask task = new InstallationTask(activity,console);
			task.execute(base);
		} else {
			Log.d(JConsoleApp.LogTag,"bootstrapping");
			bootstrap(console);
		}
	}
	protected boolean checkInstall(File base) {
		return new File(base, "system").exists();
	}
	protected void showToast(String message) {
		showToast(message,false);
	}
	protected void showToast(String message, boolean islong) {
		Toast toast = Toast.makeText(this, message, islong ? Toast.LENGTH_LONG
				: Toast.LENGTH_SHORT);
		toast.show();
	}
	
	interface ResponseAction {
		public void action(boolean state);
	}

	class InstallationTask extends AsyncTask<File, String, String> {

		Activity activity;
		Console console;

		InstallationTask(Activity activity, Console console) {
			this.activity = activity;
			this.console = console;
		}

		@Override
		public void onPreExecute() {
			console.setEnabled(false);
		}

		@Override
		public void onPostExecute(String s) {
			bootstrap(console);
			
			console.setEnabled(true);
		}

		@Override
		protected void onProgressUpdate(String... i) {
			String limit = i[0];
			showToast(limit);
		}

		@Override
		protected String doInBackground(File... params) {
			try {
				doInstall(params[0]);
			} catch (IOException e) {
				publishProgress("error during installation: "
						+ e.getLocalizedMessage());
			}
			return "OK";
		}

		protected boolean doInstall(File base) throws IOException {
			publishProgress("performing first-boot installation");
			publishProgress("installing system files");
			installDirectory(base, "system");
			installDirectory(base, "bin");

			publishProgress("installing help files");
			installDirectory(base, "docs");

			publishProgress("installing addons");
			publishProgress("(addons take awhile)");
			installDirectory(base, "addons");			
			
			publishProgress("installing test files");
			installDirectory(base, "test");
			
			publishProgress("installation complete");

			return true;
		}

		protected boolean _installFile(File base, String path) 
			throws IOException {
			byte buff[] = new byte[8092];
			InputStream in = getAssets().open(path);
			OutputStream out = new FileOutputStream(new File(base, path));
			int n;
			while ((n = in.read(buff)) != -1) {
				out.write(buff, 0, n);
			}
			out.close();
			in.close();
			return true;
		}		
		
		
		protected boolean installFile(File base, String path) {
			try {
				return _installFile(base,path);
			} catch (Exception e) {
				Log.e(JConsoleApp.LogTag, "failed to install " + path);
			}
			return false;
		}

		protected File createDirectory(File base, String d) {
			File f = new File(base, d);
			f.mkdirs();
			return f;
		}

		protected boolean installDirectory(File base, String directory)
				throws IOException {
			AssetManager am = getAssets();
			boolean res = true;
			String[] tests = am.list(directory);
			createDirectory(base, directory);
			for (String t : tests) {
				try {
					res &= _installFile(base, directory + "/" + t);
				} catch(FileNotFoundException e) {
					Log.i(JConsoleApp.LogTag,"recursing to " + directory + "/" + t);
					installDirectory(base,directory + "/" + t);
				}
			}
			return res;
		}
	}
	
	public JInterface getjInterface() {
		return jInterface;
	}
	/*
	public void setjInterface(JInterface jInterface) {
		this.jInterface = jInterface;
	}
	public String getCurrentWindow() {
		return currentWindow;
	}
	public void setCurrentWindow(String currentWindow) {
		this.currentWindow = currentWindow;
	}
	*/
	/*
	public FileEdit getCurrentEditor() {
		return currentEditor;
	}
	public void setCurrentEditor(FileEdit currentEditor) {
		this.currentEditor = currentEditor;
	}
	*/
	public java.util.List<String> getHistory() {
		return history;
	}
	public void setHistory(java.util.List<String> history) {
		this.history = history;
	}
	public File getRoot() {
		return root;
	}
	public void setRoot(File root) {
		this.root = root;
	}
	public File getCurrentLocalDir() {
		return currentLocalDir;
	}
	public void setCurrentLocalDir(File currentDir) {
		currentLocalDir = currentDir;
	}
	public File getCurrentExternDir() {
		return currentExternDir;
	}
	public void setCurrentExternDir(File currentDir) {
		currentExternDir = currentDir;
	}
	
	public void setCurrentDirectory(File dir) {
		if(localFile) setCurrentLocalDir(dir);
		else setCurrentExternDir(dir);			
	}

	
	public File getCurrentDirectory() {
		File f = null;
		if(localFile) {
			f = getCurrentLocalDir();
		} else {
			f = getCurrentExternDir();
		}
		return f;
	}
	public String getTempDir() {
		return tempDir;
	}
	class JHSTask extends JTask {
		protected Integer doInBackground(String... params) {
			String[] cmds = {
					"load '~addons/ide/jhs/core.ijs'",
					"init_jhs_''"
			};
//			Log.d(LogTag,"starting JHS");
			super.doInBackground(cmds);
			Log.d(LogTag,"returned from starting JHS");
			return 0;
		}		
	}
	
	class JTask extends AsyncTask<String, EngineOutput, Integer> 
		implements OutputListener {
	
		int width, height;
		@Override
		public void onProgressUpdate(EngineOutput... oo) {
			EngineOutput o = oo[0];
			consoleOutput(o);
		}
	
		public void onOutput(int type, String content) {
			publishProgress(new EngineOutput(type, content));
		}
	
		@Override
		protected void onPreExecute() {
			console.setEnabled(false);
			Dimension dd = console.getDimension();
			width = dd.width;
			height = dd.height;
		}
	
		@Override
		protected Integer doInBackground(String... params) {
			Integer res = -1;
			StringBuilder sb = new StringBuilder();
			sb.append("Cwh_j_ =: ").append(width).append(" ").append(height);
			res = jInterface.callJ(sb.toString());
			jInterface.addOutputListener(this);
			for(String sentence : params) {
				res = jInterface.callJ(sentence);
			}
			jInterface.removeOutputListener(this);
			return res;
		}

		
		@Override
		protected void onPostExecute(Integer code) {
			// this is a worry, in the world of async windows
			/*
			EditorData ed = windows.get(JActivity.CONSOLE_NAME);
			if(ed!=null) {
				ed.placeCursor();
			}
			*/
//			console.placeCursor();
//			console.prompt();
			consoleOutput(JInterface.MTYOFM,"  ");
			console.setEnabled(true);
		}
	}
	
	boolean testJHSServer() {
		boolean result = false;
		HttpClient client = new DefaultHttpClient();
		HttpGet get = new HttpGet("http://localhost:65001/jijx");
		
		try {
			client.execute(get);
			result = true;
		} catch(Exception e) {
			// ignore
		}
		return result;
	}

	class JHSLauncherTask extends AsyncTask<String, Integer, String> {

		Context context;
		boolean ready = false;
		public JHSLauncherTask(Context context) {
			this.context = context;
		}
		
		@Override
		protected String doInBackground(String... params) {
			boolean loop = true;
			if(params != null && params.length > 0 && "ready".equals(params[0])) {
				ready = true;
				loop = false;
			}
			
			long start = System.currentTimeMillis();
			publishProgress(0);
			// try to wait for JHS to start
			long waitFor = 1000;
			while(loop) {
				try {
					if(loop && waitFor > 0) Thread.sleep(waitFor);
				} catch(Exception e) {
					// ignore
				}

				if(testJHSServer()) {
					ready = true;
					loop = false;
				}
				// wait no more than 15 seconds, then abort
				long ll = System.currentTimeMillis() - start;
				if(ll > 15000) {
					loop = false;
					publishProgress(-1);
				} else {
					publishProgress((int)(ll/100));
				}
				waitFor = 500;
			}
			return null;
		}
		@Override
		protected void onPostExecute(String code) {
			if(ready) {
				Intent myIntent = new Intent(Intent.ACTION_VIEW,
					Uri.parse("http://localhost:65001/jijxipad"));
				consoleOutput(JInterface.MTYOFM,"launching browser\n");
				context.startActivity(myIntent);
			} else {
				AlertDialog.Builder builder = new AlertDialog.Builder(context);
				builder.setMessage("failed to connect to JHS server");
				builder.setPositiveButton("Ok", new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int which) {
						dialog.dismiss();
					}
				});
				builder.show();
			}
			
		}		
		
		@Override
		public void onProgressUpdate(Integer... oo) {
			EngineOutput out;
			if(oo[0] == -1) {
				out = new EngineOutput(JInterface.MTYOLOG, "failed to establish JHS server.\n");
				consoleOutput(out);
			} else {
				
			}
//			EngineOutput out = new EngineOutput(JInterface.MTYOLOG, "waiting for JHS to start: " + oo[0] + "\n");
			Log.d(LogTag,"waiting: " + oo);
		}
	}
}
