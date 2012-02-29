NB. OpenGL graphics definitions

coclass 'jgl3'

3 : 0'' NB. set opengl cd library
if. UNAME-:'Win' do.
  libgl=: 'opengl32.dll'
  libglu=: 'glu32.dll'
elseif. UNAME-:'Linux' do.
  if. IFANDROID do.
    libgl=:  'libGLESv2.so'
    libglu=: 'libEGL.so'
  else.
    libgl=:  'libGL.so.1'
    libglu=: 'libGLU.so.1'
  end.
elseif. UNAME-:'Darwin' do.
  libgl=: '/System/Library/Frameworks/OpenGL.framework/Libraries/libGL.dylib'
  libglu=: '/System/Library/Frameworks/OpenGL.framework/Libraries/libGLU.dylib'
end.
)

openglCall=: 1 : ('(''',libgl,' '',m) & (15!:0)')
opengluCall=: 1 : ('(''',libglu,' '',m) & (15!:0)')

f=. 4 : 0
y=. <;.2 y
n=. >: y i. &> ''''
0!:100 ;(n{.each y) ,each (<x) ,each n }.each y
)

GL_2D=: 16b0600
GL_2_BYTES=: 16b1407
GL_3D=: 16b0601
GL_3D_COLOR=: 16b0602
GL_3D_COLOR_TEXTURE=: 16b0603
GL_3_BYTES=: 16b1408
GL_4D_COLOR_TEXTURE=: 16b0604
GL_4_BYTES=: 16b1409
GL_ACCUM=: 16b0100
GL_ACCUM_ALPHA_BITS=: 16b0d5b
GL_ACCUM_BLUE_BITS=: 16b0d5a
GL_ACCUM_BUFFER_BIT=: 16b00000200
GL_ACCUM_CLEAR_VALUE=: 16b0b80
GL_ACCUM_GREEN_BITS=: 16b0d59
GL_ACCUM_RED_BITS=: 16b0d58
GL_ADD=: 16b0104
GL_ALL_ATTRIB_BITS=: 16b000fffff
GL_ALPHA12=: 16b803d
GL_ALPHA16=: 16b803e
GL_ALPHA4=: 16b803b
GL_ALPHA8=: 16b803c
GL_ALPHA=: 16b1906
GL_ALPHA_BIAS=: 16b0d1d
GL_ALPHA_BITS=: 16b0d55
GL_ALPHA_SCALE=: 16b0d1c
GL_ALPHA_TEST=: 16b0bc0
GL_ALPHA_TEST_FUNC=: 16b0bc1
GL_ALPHA_TEST_REF=: 16b0bc2
GL_ALWAYS=: 16b0207
GL_AMBIENT=: 16b1200
GL_AMBIENT_AND_DIFFUSE=: 16b1602
GL_AND=: 16b1501
GL_AND_INVERTED=: 16b1504
GL_AND_REVERSE=: 16b1502
GL_ATTRIB_STACK_DEPTH=: 16b0bb0
GL_AUTO_NORMAL=: 16b0d80
GL_AUX0=: 16b0409
GL_AUX1=: 16b040a
GL_AUX2=: 16b040b
GL_AUX3=: 16b040c
GL_AUX_BUFFERS=: 16b0c00
GL_BACK=: 16b0405
GL_BACK_LEFT=: 16b0402
GL_BACK_RIGHT=: 16b0403
GL_BGRA_EXT=: 16b80e1
GL_BGR_EXT=: 16b80e0
GL_BITMAP=: 16b1a00
GL_BITMAP_TOKEN=: 16b0704
GL_BLEND=: 16b0be2
GL_BLEND_DST=: 16b0be0
GL_BLEND_SRC=: 16b0be1
GL_BLUE=: 16b1905
GL_BLUE_BIAS=: 16b0d1b
GL_BLUE_BITS=: 16b0d54
GL_BLUE_SCALE=: 16b0d1a
GL_BYTE=: 16b1400
GL_C3F_V3F=: 16b2a24
GL_C4F_N3F_V3F=: 16b2a26
GL_C4UB_V2F=: 16b2a22
GL_C4UB_V3F=: 16b2a23
GL_CCW=: 16b0901
GL_CLAMP=: 16b2900
GL_CLEAR=: 16b1500
GL_CLIENT_ALL_ATTRIB_BITS=: 16bffffffff
GL_CLIENT_ATTRIB_STACK_DEPTH=: 16b0bb1
GL_CLIENT_PIXEL_STORE_BIT=: 16b00000001
GL_CLIENT_VERTEX_ARRAY_BIT=: 16b00000002
GL_CLIP_PLANE0=: 16b3000
GL_CLIP_PLANE1=: 16b3001
GL_CLIP_PLANE2=: 16b3002
GL_CLIP_PLANE3=: 16b3003
GL_CLIP_PLANE4=: 16b3004
GL_CLIP_PLANE5=: 16b3005
GL_COEFF=: 16b0a00
GL_COLOR=: 16b1800
GL_COLOR_ARRAY=: 16b8076
GL_COLOR_ARRAY_COUNT_EXT=: 16b8084
GL_COLOR_ARRAY_EXT=: 16b8076
GL_COLOR_ARRAY_POINTER=: 16b8090
GL_COLOR_ARRAY_POINTER_EXT=: 16b8090
GL_COLOR_ARRAY_SIZE=: 16b8081
GL_COLOR_ARRAY_SIZE_EXT=: 16b8081
GL_COLOR_ARRAY_STRIDE=: 16b8083
GL_COLOR_ARRAY_STRIDE_EXT=: 16b8083
GL_COLOR_ARRAY_TYPE=: 16b8082
GL_COLOR_ARRAY_TYPE_EXT=: 16b8082
GL_COLOR_BUFFER_BIT=: 16b00004000
GL_COLOR_CLEAR_VALUE=: 16b0c22
GL_COLOR_INDEX12_EXT=: 16b80e6
GL_COLOR_INDEX16_EXT=: 16b80e7
GL_COLOR_INDEX1_EXT=: 16b80e2
GL_COLOR_INDEX2_EXT=: 16b80e3
GL_COLOR_INDEX4_EXT=: 16b80e4
GL_COLOR_INDEX8_EXT=: 16b80e5
GL_COLOR_INDEX=: 16b1900
GL_COLOR_INDEXES=: 16b1603
GL_COLOR_LOGIC_OP=: 16b0bf2
GL_COLOR_MATERIAL=: 16b0b57
GL_COLOR_MATERIAL_FACE=: 16b0b55
GL_COLOR_MATERIAL_PARAMETER=: 16b0b56
GL_COLOR_TABLE_ALPHA_SIZE_EXT=: 16b80dd
GL_COLOR_TABLE_BLUE_SIZE_EXT=: 16b80dc
GL_COLOR_TABLE_FORMAT_EXT=: 16b80d8
GL_COLOR_TABLE_GREEN_SIZE_EXT=: 16b80db
GL_COLOR_TABLE_INTENSITY_SIZE_EXT=: 16b80df
GL_COLOR_TABLE_LUMINANCE_SIZE_EXT=: 16b80de
GL_COLOR_TABLE_RED_SIZE_EXT=: 16b80da
GL_COLOR_TABLE_WIDTH_EXT=: 16b80d9
GL_COLOR_WRITEMASK=: 16b0c23
GL_COMPILE=: 16b1300
GL_COMPILE_AND_EXECUTE=: 16b1301
GL_CONSTANT_ATTENUATION=: 16b1207
GL_COPY=: 16b1503
GL_COPY_INVERTED=: 16b150c
GL_COPY_PIXEL_TOKEN=: 16b0706
GL_CULL_FACE=: 16b0b44
GL_CULL_FACE_MODE=: 16b0b45
GL_CURRENT_BIT=: 16b00000001
GL_CURRENT_COLOR=: 16b0b00
GL_CURRENT_INDEX=: 16b0b01
GL_CURRENT_NORMAL=: 16b0b02
GL_CURRENT_RASTER_COLOR=: 16b0b04
GL_CURRENT_RASTER_DISTANCE=: 16b0b09
GL_CURRENT_RASTER_INDEX=: 16b0b05
GL_CURRENT_RASTER_POSITION=: 16b0b07
GL_CURRENT_RASTER_POSITION_VALID=: 16b0b08
GL_CURRENT_RASTER_TEXTURE_COORDS=: 16b0b06
GL_CURRENT_TEXTURE_COORDS=: 16b0b03
GL_CW=: 16b0900
GL_DECAL=: 16b2101
GL_DECR=: 16b1e03
GL_DEPTH=: 16b1801
GL_DEPTH_BIAS=: 16b0d1f
GL_DEPTH_BITS=: 16b0d56
GL_DEPTH_BUFFER_BIT=: 16b00000100
GL_DEPTH_CLEAR_VALUE=: 16b0b73
GL_DEPTH_COMPONENT=: 16b1902
GL_DEPTH_FUNC=: 16b0b74
GL_DEPTH_RANGE=: 16b0b70
GL_DEPTH_SCALE=: 16b0d1e
GL_DEPTH_TEST=: 16b0b71
GL_DEPTH_WRITEMASK=: 16b0b72
GL_DIFFUSE=: 16b1201
GL_DITHER=: 16b0bd0
GL_DOMAIN=: 16b0a02
GL_DONT_CARE=: 16b1100
GL_DOUBLE=: 16b140a
GL_DOUBLEBUFFER=: 16b0c32
GL_DOUBLE_EXT=: 16b140a
GL_DRAW_BUFFER=: 16b0c01
GL_DRAW_PIXEL_TOKEN=: 16b0705
GL_DST_ALPHA=: 16b0304
GL_DST_COLOR=: 16b0306
GL_EDGE_FLAG=: 16b0b43
GL_EDGE_FLAG_ARRAY=: 16b8079
GL_EDGE_FLAG_ARRAY_COUNT_EXT=: 16b808d
GL_EDGE_FLAG_ARRAY_EXT=: 16b8079
GL_EDGE_FLAG_ARRAY_POINTER=: 16b8093
GL_EDGE_FLAG_ARRAY_POINTER_EXT=: 16b8093
GL_EDGE_FLAG_ARRAY_STRIDE=: 16b808c
GL_EDGE_FLAG_ARRAY_STRIDE_EXT=: 16b808c
GL_EMISSION=: 16b1600
GL_ENABLE_BIT=: 16b00002000
GL_EQUAL=: 16b0202
GL_EQUIV=: 16b1509
GL_EVAL_BIT=: 16b00010000
GL_EXP2=: 16b0801
GL_EXP=: 16b0800
GL_EXTENSIONS=: 16b1f03
GL_EXT_bgra=: 1
GL_EXT_paletted_texture=: 1
GL_EXT_vertex_array=: 1
GL_EYE_LINEAR=: 16b2400
GL_EYE_PLANE=: 16b2502
GL_FALSE=: 0
GL_FASTEST=: 16b1101
GL_FEEDBACK=: 16b1c01
GL_FEEDBACK_BUFFER_POINTER=: 16b0df0
GL_FEEDBACK_BUFFER_SIZE=: 16b0df1
GL_FEEDBACK_BUFFER_TYPE=: 16b0df2
GL_FILL=: 16b1b02
GL_FLAT=: 16b1d00
GL_FLOAT=: 16b1406
GL_FOG=: 16b0b60
GL_FOG_BIT=: 16b00000080
GL_FOG_COLOR=: 16b0b66
GL_FOG_DENSITY=: 16b0b62
GL_FOG_END=: 16b0b64
GL_FOG_HINT=: 16b0c54
GL_FOG_INDEX=: 16b0b61
GL_FOG_MODE=: 16b0b65
GL_FOG_SPECULAR_TEXTURE_WIN=: 16b80ec
GL_FOG_START=: 16b0b63
GL_FRONT=: 16b0404
GL_FRONT_AND_BACK=: 16b0408
GL_FRONT_FACE=: 16b0b46
GL_FRONT_LEFT=: 16b0400
GL_FRONT_RIGHT=: 16b0401
GL_GEQUAL=: 16b0206
GL_GREATER=: 16b0204
GL_GREEN=: 16b1904
GL_GREEN_BIAS=: 16b0d19
GL_GREEN_BITS=: 16b0d53
GL_GREEN_SCALE=: 16b0d18
GL_HINT_BIT=: 16b00008000
GL_INCR=: 16b1e02
GL_INDEX_ARRAY=: 16b8077
GL_INDEX_ARRAY_COUNT_EXT=: 16b8087
GL_INDEX_ARRAY_EXT=: 16b8077
GL_INDEX_ARRAY_POINTER=: 16b8091
GL_INDEX_ARRAY_POINTER_EXT=: 16b8091
GL_INDEX_ARRAY_STRIDE=: 16b8086
GL_INDEX_ARRAY_STRIDE_EXT=: 16b8086
GL_INDEX_ARRAY_TYPE=: 16b8085
GL_INDEX_ARRAY_TYPE_EXT=: 16b8085
GL_INDEX_BITS=: 16b0d51
GL_INDEX_CLEAR_VALUE=: 16b0c20
GL_INDEX_LOGIC_OP=: 16b0bf1
GL_INDEX_MODE=: 16b0c30
GL_INDEX_OFFSET=: 16b0d13
GL_INDEX_SHIFT=: 16b0d12
GL_INDEX_WRITEMASK=: 16b0c21
GL_INT=: 16b1404
GL_INTENSITY12=: 16b804c
GL_INTENSITY16=: 16b804d
GL_INTENSITY4=: 16b804a
GL_INTENSITY8=: 16b804b
GL_INTENSITY=: 16b8049
GL_INVALID_ENUM=: 16b0500
GL_INVALID_OPERATION=: 16b0502
GL_INVALID_VALUE=: 16b0501
GL_INVERT=: 16b150a
GL_KEEP=: 16b1e00
GL_LEFT=: 16b0406
GL_LEQUAL=: 16b0203
GL_LESS=: 16b0201
GL_LIGHT0=: 16b4000
GL_LIGHT1=: 16b4001
GL_LIGHT2=: 16b4002
GL_LIGHT3=: 16b4003
GL_LIGHT4=: 16b4004
GL_LIGHT5=: 16b4005
GL_LIGHT6=: 16b4006
GL_LIGHT7=: 16b4007
GL_LIGHTING=: 16b0b50
GL_LIGHTING_BIT=: 16b00000040
GL_LIGHT_MODEL_AMBIENT=: 16b0b53
GL_LIGHT_MODEL_LOCAL_VIEWER=: 16b0b51
GL_LIGHT_MODEL_TWO_SIDE=: 16b0b52
GL_LINE=: 16b1b01
GL_LINEAR=: 16b2601
GL_LINEAR_ATTENUATION=: 16b1208
GL_LINEAR_MIPMAP_LINEAR=: 16b2703
GL_LINEAR_MIPMAP_NEAREST=: 16b2701
GL_LINES=: 16b0001
GL_LINE_BIT=: 16b00000004
GL_LINE_LOOP=: 16b0002
GL_LINE_RESET_TOKEN=: 16b0707
GL_LINE_SMOOTH=: 16b0b20
GL_LINE_SMOOTH_HINT=: 16b0c52
GL_LINE_STIPPLE=: 16b0b24
GL_LINE_STIPPLE_PATTERN=: 16b0b25
GL_LINE_STIPPLE_REPEAT=: 16b0b26
GL_LINE_STRIP=: 16b0003
GL_LINE_TOKEN=: 16b0702
GL_LINE_WIDTH=: 16b0b21
GL_LINE_WIDTH_GRANULARITY=: 16b0b23
GL_LINE_WIDTH_RANGE=: 16b0b22
GL_LIST_BASE=: 16b0b32
GL_LIST_BIT=: 16b00020000
GL_LIST_INDEX=: 16b0b33
GL_LIST_MODE=: 16b0b30
GL_LOAD=: 16b0101
GL_LOGIC_OP=: 16b0bf1
GL_LOGIC_OP_MODE=: 16b0bf0
GL_LUMINANCE12=: 16b8041
GL_LUMINANCE12_ALPHA12=: 16b8047
GL_LUMINANCE12_ALPHA4=: 16b8046
GL_LUMINANCE16=: 16b8042
GL_LUMINANCE16_ALPHA16=: 16b8048
GL_LUMINANCE4=: 16b803f
GL_LUMINANCE4_ALPHA4=: 16b8043
GL_LUMINANCE6_ALPHA2=: 16b8044
GL_LUMINANCE8=: 16b8040
GL_LUMINANCE8_ALPHA8=: 16b8045
GL_LUMINANCE=: 16b1909
GL_LUMINANCE_ALPHA=: 16b190a
GL_MAP1_COLOR_4=: 16b0d90
GL_MAP1_GRID_DOMAIN=: 16b0dd0
GL_MAP1_GRID_SEGMENTS=: 16b0dd1
GL_MAP1_INDEX=: 16b0d91
GL_MAP1_NORMAL=: 16b0d92
GL_MAP1_TEXTURE_COORD_1=: 16b0d93
GL_MAP1_TEXTURE_COORD_2=: 16b0d94
GL_MAP1_TEXTURE_COORD_3=: 16b0d95
GL_MAP1_TEXTURE_COORD_4=: 16b0d96
GL_MAP1_VERTEX_3=: 16b0d97
GL_MAP1_VERTEX_4=: 16b0d98
GL_MAP2_COLOR_4=: 16b0db0
GL_MAP2_GRID_DOMAIN=: 16b0dd2
GL_MAP2_GRID_SEGMENTS=: 16b0dd3
GL_MAP2_INDEX=: 16b0db1
GL_MAP2_NORMAL=: 16b0db2
GL_MAP2_TEXTURE_COORD_1=: 16b0db3
GL_MAP2_TEXTURE_COORD_2=: 16b0db4
GL_MAP2_TEXTURE_COORD_3=: 16b0db5
GL_MAP2_TEXTURE_COORD_4=: 16b0db6
GL_MAP2_VERTEX_3=: 16b0db7
GL_MAP2_VERTEX_4=: 16b0db8
GL_MAP_COLOR=: 16b0d10
GL_MAP_STENCIL=: 16b0d11
GL_MATRIX_MODE=: 16b0ba0
GL_MAX_ATTRIB_STACK_DEPTH=: 16b0d35
GL_MAX_CLIENT_ATTRIB_STACK_DEPTH=: 16b0d3b
GL_MAX_CLIP_PLANES=: 16b0d32
GL_MAX_ELEMENTS_INDICES_WIN=: 16b80e9
GL_MAX_ELEMENTS_VERTICES_WIN=: 16b80e8
GL_MAX_EVAL_ORDER=: 16b0d30
GL_MAX_LIGHTS=: 16b0d31
GL_MAX_LIST_NESTING=: 16b0b31
GL_MAX_MODELVIEW_STACK_DEPTH=: 16b0d36
GL_MAX_NAME_STACK_DEPTH=: 16b0d37
GL_MAX_PIXEL_MAP_TABLE=: 16b0d34
GL_MAX_PROJECTION_STACK_DEPTH=: 16b0d38
GL_MAX_TEXTURE_SIZE=: 16b0d33
GL_MAX_TEXTURE_STACK_DEPTH=: 16b0d39
GL_MAX_VIEWPORT_DIMS=: 16b0d3a
GL_MODELVIEW=: 16b1700
GL_MODELVIEW_MATRIX=: 16b0ba6
GL_MODELVIEW_STACK_DEPTH=: 16b0ba3
GL_MODULATE=: 16b2100
GL_MULT=: 16b0103
GL_N3F_V3F=: 16b2a25
GL_NAME_STACK_DEPTH=: 16b0d70
GL_NAND=: 16b150e
GL_NEAREST=: 16b2600
GL_NEAREST_MIPMAP_LINEAR=: 16b2702
GL_NEAREST_MIPMAP_NEAREST=: 16b2700
GL_NEVER=: 16b0200
GL_NICEST=: 16b1102
GL_NONE=: 0
GL_NOOP=: 16b1505
GL_NOR=: 16b1508
GL_NORMALIZE=: 16b0ba1
GL_NORMAL_ARRAY=: 16b8075
GL_NORMAL_ARRAY_COUNT_EXT=: 16b8080
GL_NORMAL_ARRAY_EXT=: 16b8075
GL_NORMAL_ARRAY_POINTER=: 16b808f
GL_NORMAL_ARRAY_POINTER_EXT=: 16b808f
GL_NORMAL_ARRAY_STRIDE=: 16b807f
GL_NORMAL_ARRAY_STRIDE_EXT=: 16b807f
GL_NORMAL_ARRAY_TYPE=: 16b807e
GL_NORMAL_ARRAY_TYPE_EXT=: 16b807e
GL_NOTEQUAL=: 16b0205
GL_NO_ERROR=: 0
GL_OBJECT_LINEAR=: 16b2401
GL_OBJECT_PLANE=: 16b2501
GL_ONE=: 1
GL_ONE_MINUS_DST_ALPHA=: 16b0305
GL_ONE_MINUS_DST_COLOR=: 16b0307
GL_ONE_MINUS_SRC_ALPHA=: 16b0303
GL_ONE_MINUS_SRC_COLOR=: 16b0301
GL_OR=: 16b1507
GL_ORDER=: 16b0a01
GL_OR_INVERTED=: 16b150d
GL_OR_REVERSE=: 16b150b
GL_OUT_OF_MEMORY=: 16b0505
GL_PACK_ALIGNMENT=: 16b0d05
GL_PACK_LSB_FIRST=: 16b0d01
GL_PACK_ROW_LENGTH=: 16b0d02
GL_PACK_SKIP_PIXELS=: 16b0d04
GL_PACK_SKIP_ROWS=: 16b0d03
GL_PACK_SWAP_BYTES=: 16b0d00
GL_PASS_THROUGH_TOKEN=: 16b0700
GL_PERSPECTIVE_CORRECTION_HINT=: 16b0c50
GL_PHONG_HINT_WIN=: 16b80eb
GL_PHONG_WIN=: 16b80ea
GL_PIXEL_MAP_A_TO_A=: 16b0c79
GL_PIXEL_MAP_A_TO_A_SIZE=: 16b0cb9
GL_PIXEL_MAP_B_TO_B=: 16b0c78
GL_PIXEL_MAP_B_TO_B_SIZE=: 16b0cb8
GL_PIXEL_MAP_G_TO_G=: 16b0c77
GL_PIXEL_MAP_G_TO_G_SIZE=: 16b0cb7
GL_PIXEL_MAP_I_TO_A=: 16b0c75
GL_PIXEL_MAP_I_TO_A_SIZE=: 16b0cb5
GL_PIXEL_MAP_I_TO_B=: 16b0c74
GL_PIXEL_MAP_I_TO_B_SIZE=: 16b0cb4
GL_PIXEL_MAP_I_TO_G=: 16b0c73
GL_PIXEL_MAP_I_TO_G_SIZE=: 16b0cb3
GL_PIXEL_MAP_I_TO_I=: 16b0c70
GL_PIXEL_MAP_I_TO_I_SIZE=: 16b0cb0
GL_PIXEL_MAP_I_TO_R=: 16b0c72
GL_PIXEL_MAP_I_TO_R_SIZE=: 16b0cb2
GL_PIXEL_MAP_R_TO_R=: 16b0c76
GL_PIXEL_MAP_R_TO_R_SIZE=: 16b0cb6
GL_PIXEL_MAP_S_TO_S=: 16b0c71
GL_PIXEL_MAP_S_TO_S_SIZE=: 16b0cb1
GL_PIXEL_MODE_BIT=: 16b00000020
GL_POINT=: 16b1b00
GL_POINTS=: 16b0000
GL_POINT_BIT=: 16b00000002
GL_POINT_SIZE=: 16b0b11
GL_POINT_SIZE_GRANULARITY=: 16b0b13
GL_POINT_SIZE_RANGE=: 16b0b12
GL_POINT_SMOOTH=: 16b0b10
GL_POINT_SMOOTH_HINT=: 16b0c51
GL_POINT_TOKEN=: 16b0701
GL_POLYGON=: 16b0009
GL_POLYGON_BIT=: 16b00000008
GL_POLYGON_MODE=: 16b0b40
GL_POLYGON_OFFSET_FACTOR=: 16b8038
GL_POLYGON_OFFSET_FILL=: 16b8037
GL_POLYGON_OFFSET_LINE=: 16b2a02
GL_POLYGON_OFFSET_POINT=: 16b2a01
GL_POLYGON_OFFSET_UNITS=: 16b2a00
GL_POLYGON_SMOOTH=: 16b0b41
GL_POLYGON_SMOOTH_HINT=: 16b0c53
GL_POLYGON_STIPPLE=: 16b0b42
GL_POLYGON_STIPPLE_BIT=: 16b00000010
GL_POLYGON_TOKEN=: 16b0703
GL_POSITION=: 16b1203
GL_PROJECTION=: 16b1701
GL_PROJECTION_MATRIX=: 16b0ba7
GL_PROJECTION_STACK_DEPTH=: 16b0ba4
GL_PROXY_TEXTURE_1D=: 16b8063
GL_PROXY_TEXTURE_2D=: 16b8064
GL_Q=: 16b2003
GL_QUADRATIC_ATTENUATION=: 16b1209
GL_QUADS=: 16b0007
GL_QUAD_STRIP=: 16b0008
GL_R3_G3_B2=: 16b2a10
GL_R=: 16b2002
GL_READ_BUFFER=: 16b0c02
GL_RED=: 16b1903
GL_RED_BIAS=: 16b0d15
GL_RED_BITS=: 16b0d52
GL_RED_SCALE=: 16b0d14
GL_RENDER=: 16b1c00
GL_RENDERER=: 16b1f01
GL_RENDER_MODE=: 16b0c40
GL_REPEAT=: 16b2901
GL_REPLACE=: 16b1e01
GL_RETURN=: 16b0102
GL_RGB10=: 16b8052
GL_RGB10_A2=: 16b8059
GL_RGB12=: 16b8053
GL_RGB16=: 16b8054
GL_RGB4=: 16b804f
GL_RGB5=: 16b8050
GL_RGB5_A1=: 16b8057
GL_RGB8=: 16b8051
GL_RGB=: 16b1907
GL_RGBA12=: 16b805a
GL_RGBA16=: 16b805b
GL_RGBA2=: 16b8055
GL_RGBA4=: 16b8056
GL_RGBA8=: 16b8058
GL_RGBA=: 16b1908
GL_RGBA_MODE=: 16b0c31
GL_RIGHT=: 16b0407
GL_S=: 16b2000
GL_SCISSOR_BIT=: 16b00080000
GL_SCISSOR_BOX=: 16b0c10
GL_SCISSOR_TEST=: 16b0c11
GL_SELECT=: 16b1c02
GL_SELECTION_BUFFER_POINTER=: 16b0df3
GL_SELECTION_BUFFER_SIZE=: 16b0df4
GL_SET=: 16b150f
GL_SHADE_MODEL=: 16b0b54
GL_SHININESS=: 16b1601
GL_SHORT=: 16b1402
GL_SMOOTH=: 16b1d01
GL_SPECULAR=: 16b1202
GL_SPHERE_MAP=: 16b2402
GL_SPOT_CUTOFF=: 16b1206
GL_SPOT_DIRECTION=: 16b1204
GL_SPOT_EXPONENT=: 16b1205
GL_SRC_ALPHA=: 16b0302
GL_SRC_ALPHA_SATURATE=: 16b0308
GL_SRC_COLOR=: 16b0300
GL_STACK_OVERFLOW=: 16b0503
GL_STACK_UNDERFLOW=: 16b0504
GL_STENCIL=: 16b1802
GL_STENCIL_BITS=: 16b0d57
GL_STENCIL_BUFFER_BIT=: 16b00000400
GL_STENCIL_CLEAR_VALUE=: 16b0b91
GL_STENCIL_FAIL=: 16b0b94
GL_STENCIL_FUNC=: 16b0b92
GL_STENCIL_INDEX=: 16b1901
GL_STENCIL_PASS_DEPTH_FAIL=: 16b0b95
GL_STENCIL_PASS_DEPTH_PASS=: 16b0b96
GL_STENCIL_REF=: 16b0b97
GL_STENCIL_TEST=: 16b0b90
GL_STENCIL_VALUE_MASK=: 16b0b93
GL_STENCIL_WRITEMASK=: 16b0b98
GL_STEREO=: 16b0c33
GL_SUBPIXEL_BITS=: 16b0d50
GL_T2F_C3F_V3F=: 16b2a2a
GL_T2F_C4F_N3F_V3F=: 16b2a2c
GL_T2F_C4UB_V3F=: 16b2a29
GL_T2F_N3F_V3F=: 16b2a2b
GL_T2F_V3F=: 16b2a27
GL_T4F_C4F_N3F_V4F=: 16b2a2d
GL_T4F_V4F=: 16b2a28
GL_T=: 16b2001
GL_TEXTURE=: 16b1702
GL_TEXTURE_1D=: 16b0de0
GL_TEXTURE_2D=: 16b0de1
GL_TEXTURE_ALPHA_SIZE=: 16b805f
GL_TEXTURE_BINDING_1D=: 16b8068
GL_TEXTURE_BINDING_2D=: 16b8069
GL_TEXTURE_BIT=: 16b00040000
GL_TEXTURE_BLUE_SIZE=: 16b805e
GL_TEXTURE_BORDER=: 16b1005
GL_TEXTURE_BORDER_COLOR=: 16b1004
GL_TEXTURE_COMPONENTS=: 16b1003
GL_TEXTURE_COORD_ARRAY=: 16b8078
GL_TEXTURE_COORD_ARRAY_COUNT_EXT=: 16b808b
GL_TEXTURE_COORD_ARRAY_EXT=: 16b8078
GL_TEXTURE_COORD_ARRAY_POINTER=: 16b8092
GL_TEXTURE_COORD_ARRAY_POINTER_EXT=: 16b8092
GL_TEXTURE_COORD_ARRAY_SIZE=: 16b8088
GL_TEXTURE_COORD_ARRAY_SIZE_EXT=: 16b8088
GL_TEXTURE_COORD_ARRAY_STRIDE=: 16b808a
GL_TEXTURE_COORD_ARRAY_STRIDE_EXT=: 16b808a
GL_TEXTURE_COORD_ARRAY_TYPE=: 16b8089
GL_TEXTURE_COORD_ARRAY_TYPE_EXT=: 16b8089
GL_TEXTURE_ENV=: 16b2300
GL_TEXTURE_ENV_COLOR=: 16b2201
GL_TEXTURE_ENV_MODE=: 16b2200
GL_TEXTURE_GEN_MODE=: 16b2500
GL_TEXTURE_GEN_Q=: 16b0c63
GL_TEXTURE_GEN_R=: 16b0c62
GL_TEXTURE_GEN_S=: 16b0c60
GL_TEXTURE_GEN_T=: 16b0c61
GL_TEXTURE_GREEN_SIZE=: 16b805d
GL_TEXTURE_HEIGHT=: 16b1001
GL_TEXTURE_INTENSITY_SIZE=: 16b8061
GL_TEXTURE_INTERNAL_FORMAT=: 16b1003
GL_TEXTURE_LUMINANCE_SIZE=: 16b8060
GL_TEXTURE_MAG_FILTER=: 16b2800
GL_TEXTURE_MATRIX=: 16b0ba8
GL_TEXTURE_MIN_FILTER=: 16b2801
GL_TEXTURE_PRIORITY=: 16b8066
GL_TEXTURE_RED_SIZE=: 16b805c
GL_TEXTURE_RESIDENT=: 16b8067
GL_TEXTURE_STACK_DEPTH=: 16b0ba5
GL_TEXTURE_WIDTH=: 16b1000
GL_TEXTURE_WRAP_S=: 16b2802
GL_TEXTURE_WRAP_T=: 16b2803
GL_TRANSFORM_BIT=: 16b00001000
GL_TRIANGLES=: 16b0004
GL_TRIANGLE_FAN=: 16b0006
GL_TRIANGLE_STRIP=: 16b0005
GL_TRUE=: 1
GL_UNPACK_ALIGNMENT=: 16b0cf5
GL_UNPACK_LSB_FIRST=: 16b0cf1
GL_UNPACK_ROW_LENGTH=: 16b0cf2
GL_UNPACK_SKIP_PIXELS=: 16b0cf4
GL_UNPACK_SKIP_ROWS=: 16b0cf3
GL_UNPACK_SWAP_BYTES=: 16b0cf0
GL_UNSIGNED_BYTE=: 16b1401
GL_UNSIGNED_INT=: 16b1405
GL_UNSIGNED_SHORT=: 16b1403
GL_V2F=: 16b2a20
GL_V3F=: 16b2a21
GL_VENDOR=: 16b1f00
GL_VERSION=: 16b1f02
GL_VERSION_1_1=: 1
GL_VERTEX_ARRAY=: 16b8074
GL_VERTEX_ARRAY_COUNT_EXT=: 16b807d
GL_VERTEX_ARRAY_EXT=: 16b8074
GL_VERTEX_ARRAY_POINTER=: 16b808e
GL_VERTEX_ARRAY_POINTER_EXT=: 16b808e
GL_VERTEX_ARRAY_SIZE=: 16b807a
GL_VERTEX_ARRAY_SIZE_EXT=: 16b807a
GL_VERTEX_ARRAY_STRIDE=: 16b807c
GL_VERTEX_ARRAY_STRIDE_EXT=: 16b807c
GL_VERTEX_ARRAY_TYPE=: 16b807b
GL_VERTEX_ARRAY_TYPE_EXT=: 16b807b
GL_VIEWPORT=: 16b0ba2
GL_VIEWPORT_BIT=: 16b00000800
GL_WIN_draw_range_elements=: 1
GL_WIN_swap_hint=: 1
GL_XOR=: 16b1506
GL_ZERO=: 0
GL_ZOOM_X=: 16b0d16
GL_ZOOM_Y=: 16b0d17

GLU_AUTO_LOAD_MATRIX=: 100200
GLU_BEGIN=: 100100
GLU_CCW=: 100121
GLU_CULLING=: 100201
GLU_CW=: 100120
GLU_DISPLAY_MODE=: 100204
GLU_DOMAIN_DISTANCE=: 100217
GLU_EDGE_FLAG=: 100104
GLU_END=: 100102
GLU_ERROR=: 100103
GLU_EXTENSIONS=: 100801
GLU_EXTERIOR=: 100123
GLU_FALSE=: 0
GLU_FILL=: 100012
GLU_FLAT=: 100001
GLU_INCOMPATIBLE_GL_VERSION=: 100903
GLU_INSIDE=: 100021
GLU_INTERIOR=: 100122
GLU_INVALID_ENUM=: 100900
GLU_INVALID_VALUE=: 100901
GLU_LINE=: 100011
GLU_MAP1_TRIM_2=: 100210
GLU_MAP1_TRIM_3=: 100211
GLU_NONE=: 100002
GLU_NURBS_ERROR10=: 100260
GLU_NURBS_ERROR11=: 100261
GLU_NURBS_ERROR12=: 100262
GLU_NURBS_ERROR13=: 100263
GLU_NURBS_ERROR14=: 100264
GLU_NURBS_ERROR15=: 100265
GLU_NURBS_ERROR16=: 100266
GLU_NURBS_ERROR17=: 100267
GLU_NURBS_ERROR18=: 100268
GLU_NURBS_ERROR19=: 100269
GLU_NURBS_ERROR1=: 100251
GLU_NURBS_ERROR20=: 100270
GLU_NURBS_ERROR21=: 100271
GLU_NURBS_ERROR22=: 100272
GLU_NURBS_ERROR23=: 100273
GLU_NURBS_ERROR24=: 100274
GLU_NURBS_ERROR25=: 100275
GLU_NURBS_ERROR26=: 100276
GLU_NURBS_ERROR27=: 100277
GLU_NURBS_ERROR28=: 100278
GLU_NURBS_ERROR29=: 100279
GLU_NURBS_ERROR2=: 100252
GLU_NURBS_ERROR30=: 100280
GLU_NURBS_ERROR31=: 100281
GLU_NURBS_ERROR32=: 100282
GLU_NURBS_ERROR33=: 100283
GLU_NURBS_ERROR34=: 100284
GLU_NURBS_ERROR35=: 100285
GLU_NURBS_ERROR36=: 100286
GLU_NURBS_ERROR37=: 100287
GLU_NURBS_ERROR3=: 100253
GLU_NURBS_ERROR4=: 100254
GLU_NURBS_ERROR5=: 100255
GLU_NURBS_ERROR6=: 100256
GLU_NURBS_ERROR7=: 100257
GLU_NURBS_ERROR8=: 100258
GLU_NURBS_ERROR9=: 100259
GLU_OUTLINE_PATCH=: 100241
GLU_OUTLINE_POLYGON=: 100240
GLU_OUTSIDE=: 100020
GLU_OUT_OF_MEMORY=: 100902
GLU_PARAMETRIC_ERROR=: 100216
GLU_PARAMETRIC_TOLERANCE=: 100202
GLU_PATH_LENGTH=: 100215
GLU_POINT=: 100010
GLU_SAMPLING_METHOD=: 100205
GLU_SAMPLING_TOLERANCE=: 100203
GLU_SILHOUETTE=: 100013
GLU_SMOOTH=: 100000
GLU_TESS_BEGIN=: 100100
GLU_TESS_BEGIN_DATA=: 100106
GLU_TESS_BOUNDARY_ONLY=: 100141
GLU_TESS_COMBINE=: 100105
GLU_TESS_COMBINE_DATA=: 100111
GLU_TESS_COORD_TOO_LARGE=: 100155
GLU_TESS_EDGE_FLAG=: 100104
GLU_TESS_EDGE_FLAG_DATA=: 100110
GLU_TESS_END=: 100102
GLU_TESS_END_DATA=: 100108
GLU_TESS_ERROR1=: 100151
GLU_TESS_ERROR2=: 100152
GLU_TESS_ERROR3=: 100153
GLU_TESS_ERROR4=: 100154
GLU_TESS_ERROR5=: 100155
GLU_TESS_ERROR6=: 100156
GLU_TESS_ERROR7=: 100157
GLU_TESS_ERROR8=: 100158
GLU_TESS_ERROR=: 100103
GLU_TESS_ERROR_DATA=: 100109
GLU_TESS_MAX_COORD=: 1.0e150
GLU_TESS_MISSING_BEGIN_CONTOUR=: 100152
GLU_TESS_MISSING_BEGIN_POLYGON=: 100151
GLU_TESS_MISSING_END_CONTOUR=: 100154
GLU_TESS_MISSING_END_POLYGON=: 100153
GLU_TESS_NEED_COMBINE_CALLBACK=: 100156
GLU_TESS_TOLERANCE=: 100142
GLU_TESS_VERTEX=: 100101
GLU_TESS_VERTEX_DATA=: 100107
GLU_TESS_WINDING_ABS_GEQ_TWO=: 100134
GLU_TESS_WINDING_NEGATIVE=: 100133
GLU_TESS_WINDING_NONZERO=: 100131
GLU_TESS_WINDING_ODD=: 100130
GLU_TESS_WINDING_POSITIVE=: 100132
GLU_TESS_WINDING_RULE=: 100140
GLU_TRUE=: 1
GLU_UNKNOWN=: 100124
GLU_U_STEP=: 100206
GLU_VERSION=: 100800
GLU_VERSION_1_1=: 1
GLU_VERSION_1_2=: 1
GLU_VERTEX=: 100101
GLU_V_STEP=: 100207

AUX_ACCUM=: 8
AUX_ALPHA=: 16
AUX_AUX=: 128
AUX_BLACK=: 0
AUX_BLUE=: 16
AUX_COLORMAP=: 3
AUX_CONFIG=: 2
AUX_CONTROL=: 2
AUX_CYAN=: 18
AUX_DEPTH16=: 256
AUX_DEPTH24=: 32
AUX_DEPTH=: 256
AUX_DIRECT=: 0
AUX_DOUBLE=: 2
AUX_DOWN=: 16b28
AUX_DRAW=: 4
AUX_ESCAPE=: 16b1b
AUX_EXPOSE=: 1
AUX_FD=: 1
AUX_FIXED_332_PAL=: 512
AUX_FOGMAP=: 5
AUX_GREEN=: 14
AUX_GREYSCALEMAP=: 4
AUX_INDEX=: 1
AUX_INDIRECT=: 4
AUX_KEY=: 0
AUX_KEYEVENT=: 8
AUX_KEYSTATUS=: 1
AUX_LEFT=: 16b25
AUX_LEFTBUTTON=: 1
AUX_MAGENTA=: 17
AUX_MIDDLEBUTTON=: 4
AUX_MOUSEDOWN=: 16
AUX_MOUSELOC=: 64
AUX_MOUSESTATUS=: 3
AUX_MOUSEUP=: 32
AUX_MOUSEX=: 0
AUX_MOUSEY=: 1
AUX_ONECOLOR=: 6
AUX_RED=: 13
AUX_RETURN=: 16b0d
AUX_RGB=: 0
AUX_RGBA=: 0
AUX_RIGHT=: 16b27
AUX_RIGHTBUTTON=: 2
AUX_SHIFT=: 1
AUX_SINGLE=: 0
AUX_SPACE=: 16b20
AUX_STENCIL=: 64
AUX_UP=: 16b26
AUX_WHITE=: 19
AUX_WINDOWX=: 0
AUX_WINDOWY=: 1
AUX_YELLOW=: 15

WGL_FONT_LINES=: 0
WGL_FONT_POLYGONS=: 1

libgl f 0 : 0
glAccum=: ' glAccum > n i f' & (15!:0)
glAlphaFunc=: ' glAlphaFunc > n i f' & (15!:0)
glAreTexturesResident=: ' glAreTexturesResident > c i *i *c' & (15!:0)
glArrayElement=: ' glArrayElement > n i' & (15!:0)
glBegin=: ' glBegin > n i' & (15!:0)
glBindTexture=: ' glBindTexture > n i i' & (15!:0)
glBitmap=: ' glBitmap > n i i f f f f *' & (15!:0)
glBlendFunc=: ' glBlendFunc > n i i' & (15!:0)
glCallList=: ' glCallList > n i' & (15!:0)
glCallLists=: ' glCallLists > n i i *' & (15!:0)
glClear=: ' glClear > n i' & (15!:0)
glClearAccum=: ' glClearAccum > n f f f f' & (15!:0)
glClearColor=: ' glClearColor > n f f f f' & (15!:0)
glClearDepth=: ' glClearDepth > n d' & (15!:0)
glClearIndex=: ' glClearIndex > n f' & (15!:0)
glClearStencil=: ' glClearStencil > n i' & (15!:0)
glClipPlane=: ' glClipPlane > n i *d' & (15!:0)
glColor3b=: ' glColor3b > n c c c' & (15!:0)
glColor3bv=: ' glColor3bv > n *c' & (15!:0)
glColor3d=: ' glColor3d > n d d d' & (15!:0)
glColor3dv=: ' glColor3dv > n *d' & (15!:0)
glColor3i=: ' glColor3i > n i i i' & (15!:0)
glColor3iv=: ' glColor3iv > n *i' & (15!:0)
glColor3ub=: ' glColor3ub > n c c c' & (15!:0)
glColor3ubv=: ' glColor3ubv > n *' & (15!:0)
glColor3ui=: ' glColor3ui > n i i i' & (15!:0)
glColor3uiv=: ' glColor3uiv > n *i' & (15!:0)
glColor3us=: ' glColor3us > n s s s' & (15!:0)
glColor3usv=: ' glColor3usv > n *s' & (15!:0)
glColor4b=: ' glColor4b > n c c c c' & (15!:0)
glColor4bv=: ' glColor4bv > n *c' & (15!:0)
glColor4d=: ' glColor4d > n d d d d' & (15!:0)
glColor4dv=: ' glColor4dv > n *d' & (15!:0)
glColor4i=: ' glColor4i > n i i i i' & (15!:0)
glColor4iv=: ' glColor4iv > n *i' & (15!:0)
glColor4ub=: ' glColor4ub > n c c c c' & (15!:0)
glColor4ubv=: ' glColor4ubv > n *' & (15!:0)
glColor4ui=: ' glColor4ui > n i i i i' & (15!:0)
glColor4uiv=: ' glColor4uiv > n *i' & (15!:0)
glColor4us=: ' glColor4us > n s s s s' & (15!:0)
glColor4usv=: ' glColor4usv > n *s' & (15!:0)
glColorMask=: ' glColorMask > n c c c c' & (15!:0)
glColorMaterial=: ' glColorMaterial > n i i' & (15!:0)
glColorPointer=: ' glColorPointer > n i i i *' & (15!:0)
glCopyPixels=: ' glCopyPixels > n i i i i i' & (15!:0)
glCopyTexImage1D=: ' glCopyTexImage1D > n i i i i i i i' & (15!:0)
glCopyTexImage2D=: ' glCopyTexImage2D > n i i i i i i i i' & (15!:0)
glCopyTexSubImage1D=: ' glCopyTexSubImage1D > n i i i i i i' & (15!:0)
glCopyTexSubImage2D=: ' glCopyTexSubImage2D > n i i i i i i i i' & (15!:0)
glCullFace=: ' glCullFace > n i' & (15!:0)
glDeleteLists=: ' glDeleteLists > n i i' & (15!:0)
glDeleteTextures=: ' glDeleteTextures > n i *i' & (15!:0)
glDepthFunc=: ' glDepthFunc > n i' & (15!:0)
glDepthMask=: ' glDepthMask > n c' & (15!:0)
glDepthRange=: ' glDepthRange > n d d' & (15!:0)
glDisable=: ' glDisable > n i' & (15!:0)
glDisableClientState=: ' glDisableClientState > n i' & (15!:0)
glDrawArrays=: ' glDrawArrays > n i i i' & (15!:0)
glDrawBuffer=: ' glDrawBuffer > n i' & (15!:0)
glDrawElements=: ' glDrawElements > n i i i *' & (15!:0)
glDrawPixels=: ' glDrawPixels > n i i i i *' & (15!:0)
glEdgeFlag=: ' glEdgeFlag > n c' & (15!:0)
glEdgeFlagPointer=: ' glEdgeFlagPointer > n i *' & (15!:0)
glEdgeFlagv=: ' glEdgeFlagv > n *c' & (15!:0)
glEnable=: ' glEnable > n i' & (15!:0)
glEnableClientState=: ' glEnableClientState > n i' & (15!:0)
glEnd=: ' glEnd > n' & (15!:0)
glEndList=: ' glEndList > n' & (15!:0)
glEvalCoord1d=: ' glEvalCoord1d > n d' & (15!:0)
glEvalCoord1dv=: ' glEvalCoord1dv > n *d' & (15!:0)
glEvalCoord2d=: ' glEvalCoord2d > n d d' & (15!:0)
glEvalCoord2dv=: ' glEvalCoord2dv > n *d' & (15!:0)
glEvalMesh1=: ' glEvalMesh1 > n i i i' & (15!:0)
glEvalMesh2=: ' glEvalMesh2 > n i i i i i' & (15!:0)
glEvalPoint1=: ' glEvalPoint1 > n i' & (15!:0)
glEvalPoint2=: ' glEvalPoint2 > n i i' & (15!:0)
glFeedbackBuffer=: ' glFeedbackBuffer > n i i *f' & (15!:0)
glFinish=: ' glFinish > n' & (15!:0)
glFlush=: ' glFlush > n' & (15!:0)
glFogf=: ' glFogf > n i f' & (15!:0)
glFogfv=: ' glFogfv > n i *f' & (15!:0)
glFogi=: ' glFogi > n i i' & (15!:0)
glFogiv=: ' glFogiv > n i *i' & (15!:0)
glFrontFace=: ' glFrontFace > n i' & (15!:0)
glFrustum=: ' glFrustum > n d d d d d d' & (15!:0)
glGenLists=: ' glGenLists i i' & (15!:0)
glGenTextures=: ' glGenTextures > n i *i' & (15!:0)
glGetBooleanv=: ' glGetBooleanv > n i *c' & (15!:0)
glGetClipPlane=: ' glGetClipPlane > n i *d' & (15!:0)
glGetDoublev=: ' glGetDoublev > n i *d' & (15!:0)
glGetError=: ' glGetError > i' & (15!:0)
glGetFloatv=: ' glGetFloatv > n i *f' & (15!:0)
glGetIntegerv=: ' glGetIntegerv > n i *i' & (15!:0)
glGetLightfv=: ' glGetLightfv > n i i *f' & (15!:0)
glGetLightiv=: ' glGetLightiv > n i i *i' & (15!:0)
glGetMapdv=: ' glGetMapdv > n i i *d' & (15!:0)
glGetMapiv=: ' glGetMapiv > n i i *i' & (15!:0)
glGetMaterialfv=: ' glGetMaterialfv > n i i *f' & (15!:0)
glGetMaterialiv=: ' glGetMaterialiv > n i i *i' & (15!:0)
glGetPixelMapfv=: ' glGetPixelMapfv > n i *f' & (15!:0)
glGetPixelMapuiv=: ' glGetPixelMapuiv > n i *i' & (15!:0)
glGetPixelMapusv=: ' glGetPixelMapusv > n i *s' & (15!:0)
glGetPointerv=: ' glGetPointerv > n i *' & (15!:0)
glGetPolygonStipple=: ' glGetPolygonStipple > n *' & (15!:0)
glGetString=: ' glGetString *c i' & (15!:0)
glGetTexEnvfv=: ' glGetTexEnvfv > n i i *f' & (15!:0)
glGetTexEnviv=: ' glGetTexEnviv > n i i *i' & (15!:0)
glGetTexGendv=: ' glGetTexGendv > n i i *d' & (15!:0)
glGetTexGeniv=: ' glGetTexGeniv > n i i *i' & (15!:0)
glGetTexImage=: ' glGetTexImage > n i i i i *' & (15!:0)
glGetTexLevelParameterfv=: ' glGetTexLevelParameterfv > n i i i *f' & (15!:0)
glGetTexLevelParameteriv=: ' glGetTexLevelParameteriv > n i i i *i' & (15!:0)
glGetTexParameterfv=: ' glGetTexParameterfv > n i i *f' & (15!:0)
glGetTexParameteriv=: ' glGetTexParameteriv > n i i *i' & (15!:0)
glHint=: ' glHint > n i i' & (15!:0)
glIndexMask=: ' glIndexMask > n i' & (15!:0)
glIndexPointer=: ' glIndexPointer > n i i *' & (15!:0)
glIndexd=: ' glIndexd > n d' & (15!:0)
glIndexdv=: ' glIndexdv > n *d' & (15!:0)
glIndexi=: ' glIndexi > n i' & (15!:0)
glIndexiv=: ' glIndexiv > n *i' & (15!:0)
glIndexub=: ' glIndexub > n c' & (15!:0)
glIndexubv=: ' glIndexubv > n *' & (15!:0)
glInitNames=: ' glInitNames > n' & (15!:0)
glInterleavedArrays=: ' glInterleavedArrays > n i i *' & (15!:0)
glIsEnabled=: ' glIsEnabled > c i' & (15!:0)
glIsList=: ' glIsList > c i' & (15!:0)
glIsTexture=: ' glIsTexture > c i' & (15!:0)
glLightModelf=: ' glLightModelf > n i f' & (15!:0)
glLightModelfv=: ' glLightModelfv > n i *f' & (15!:0)
glLightModeli=: ' glLightModeli > n i i' & (15!:0)
glLightModeliv=: ' glLightModeliv > n i *i' & (15!:0)
glLightf=: ' glLightf > n i i f' & (15!:0)
glLightfv=: ' glLightfv > n i i *f' & (15!:0)
glLighti=: ' glLighti > n i i i' & (15!:0)
glLightiv=: ' glLightiv > n i i *i' & (15!:0)
glLineStipple=: ' glLineStipple > n i s' & (15!:0)
glLineWidth=: ' glLineWidth > n f' & (15!:0)
glListBase=: ' glListBase > n i' & (15!:0)
glLoadIdentity=: ' glLoadIdentity > n' & (15!:0)
glLoadMatrixd=: ' glLoadMatrixd > n *d' & (15!:0)
glLoadName=: ' glLoadName > n i' & (15!:0)
glLogicOp=: ' glLogicOp > n i' & (15!:0)
glMap1d=: ' glMap1d > n i d d i i *d' & (15!:0)
glMap2d=: ' glMap2d > n i d d i i d d i i *d' & (15!:0)
glMapGrid1d=: ' glMapGrid1d > n i d d' & (15!:0)
glMapGrid2d=: ' glMapGrid2d > n i d d i d d' & (15!:0)
glMaterialf=: ' glMaterialf > n i i f' & (15!:0)
glMaterialfv=: ' glMaterialfv > n i i *f' & (15!:0)
glMateriali=: ' glMateriali > n i i i' & (15!:0)
glMaterialiv=: ' glMaterialiv > n i i *i' & (15!:0)
glMatrixMode=: ' glMatrixMode > n i' & (15!:0)
glMultMatrixd=: ' glMultMatrixd > n *d' & (15!:0)
glNewList=: ' glNewList > n i i' & (15!:0)
glNormal3b=: ' glNormal3b > n c c c' & (15!:0)
glNormal3bv=: ' glNormal3bv > n *c' & (15!:0)
glNormal3d=: ' glNormal3d > n d d d' & (15!:0)
glNormal3dv=: ' glNormal3dv > n *d' & (15!:0)
glNormal3i=: ' glNormal3i > n i i i' & (15!:0)
glNormal3iv=: ' glNormal3iv > n *i' & (15!:0)
glNormalPointer=: ' glNormalPointer > n i i *' & (15!:0)
glOrtho=: ' glOrtho > n d d d d d d' & (15!:0)
glPassThrough=: ' glPassThrough > n f' & (15!:0)
glPixelMapfv=: ' glPixelMapfv > n i i *f' & (15!:0)
glPixelMapuiv=: ' glPixelMapuiv > n i i *i' & (15!:0)
glPixelMapusv=: ' glPixelMapusv > n i i *s' & (15!:0)
glPixelStoref=: ' glPixelStoref > n i f' & (15!:0)
glPixelStorei=: ' glPixelStorei > n i i' & (15!:0)
glPixelTransferf=: ' glPixelTransferf > n i f' & (15!:0)
glPixelTransferi=: ' glPixelTransferi > n i i' & (15!:0)
glPixelZoom=: ' glPixelZoom > n f f' & (15!:0)
glPointSize=: ' glPointSize > n f' & (15!:0)
glPolygonMode=: ' glPolygonMode > n i i' & (15!:0)
glPolygonOffset=: ' glPolygonOffset > n f f' & (15!:0)
glPolygonStipple=: ' glPolygonStipple > n *' & (15!:0)
glPopAttrib=: ' glPopAttrib > n' & (15!:0)
glPopClientAttrib=: ' glPopClientAttrib > n' & (15!:0)
glPopMatrix=: ' glPopMatrix > n' & (15!:0)
glPopName=: ' glPopName > n' & (15!:0)
glPrioritizeTextures=: ' glPrioritizeTextures > n i *i *f' & (15!:0)
glPushAttrib=: ' glPushAttrib > n i' & (15!:0)
glPushClientAttrib=: ' glPushClientAttrib > n i' & (15!:0)
glPushMatrix=: ' glPushMatrix > n' & (15!:0)
glPushName=: ' glPushName > n i' & (15!:0)
glRasterPos2d=: ' glRasterPos2d > n d d' & (15!:0)
glRasterPos2dv=: ' glRasterPos2dv > n *d' & (15!:0)
glRasterPos2i=: ' glRasterPos2i > n i i' & (15!:0)
glRasterPos2iv=: ' glRasterPos2iv > n *i' & (15!:0)
glRasterPos3d=: ' glRasterPos3d > n d d d' & (15!:0)
glRasterPos3dv=: ' glRasterPos3dv > n *d' & (15!:0)
glRasterPos3i=: ' glRasterPos3i > n i i i' & (15!:0)
glRasterPos3iv=: ' glRasterPos3iv > n *i' & (15!:0)
glRasterPos4d=: ' glRasterPos4d > n d d d d' & (15!:0)
glRasterPos4dv=: ' glRasterPos4dv > n *d' & (15!:0)
glRasterPos4i=: ' glRasterPos4i > n i i i i' & (15!:0)
glRasterPos4iv=: ' glRasterPos4iv > n *i' & (15!:0)
glReadBuffer=: ' glReadBuffer > n i' & (15!:0)
glReadPixels=: ' glReadPixels > n i i i i i i *' & (15!:0)
glRectd=: ' glRectd > n d d d d' & (15!:0)
glRectdv=: ' glRectdv > n *d *d' & (15!:0)
glRecti=: ' glRecti > n i i i i' & (15!:0)
glRectiv=: ' glRectiv > n *i *i' & (15!:0)
glRenderMode=: ' glRenderMode > i i' & (15!:0)
glRotated=: ' glRotated > n d d d d' & (15!:0)
glScaled=: ' glScaled > n d d d' & (15!:0)
glScissor=: ' glScissor > n i i i i' & (15!:0)
glSelectBuffer=: ' glSelectBuffer > n i *i' & (15!:0)
glShadeModel=: ' glShadeModel > n i' & (15!:0)
glStencilFunc=: ' glStencilFunc > n i i i' & (15!:0)
glStencilMask=: ' glStencilMask > n i' & (15!:0)
glStencilOp=: ' glStencilOp > n i i i' & (15!:0)
glTexCoord1d=: ' glTexCoord1d > n d' & (15!:0)
glTexCoord1dv=: ' glTexCoord1dv > n *d' & (15!:0)
glTexCoord1i=: ' glTexCoord1i > n i' & (15!:0)
glTexCoord1iv=: ' glTexCoord1iv > n *i' & (15!:0)
glTexCoord2d=: ' glTexCoord2d > n d d' & (15!:0)
glTexCoord2dv=: ' glTexCoord2dv > n *d' & (15!:0)
glTexCoord2i=: ' glTexCoord2i > n i i' & (15!:0)
glTexCoord2iv=: ' glTexCoord2iv > n *i' & (15!:0)
glTexCoord3d=: ' glTexCoord3d > n d d d' & (15!:0)
glTexCoord3dv=: ' glTexCoord3dv > n *d' & (15!:0)
glTexCoord3i=: ' glTexCoord3i > n i i i' & (15!:0)
glTexCoord3iv=: ' glTexCoord3iv > n *i' & (15!:0)
glTexCoord4d=: ' glTexCoord4d > n d d d d' & (15!:0)
glTexCoord4dv=: ' glTexCoord4dv > n *d' & (15!:0)
glTexCoord4i=: ' glTexCoord4i > n i i i i' & (15!:0)
glTexCoord4iv=: ' glTexCoord4iv > n *i' & (15!:0)
glTexCoordPointer=: ' glTexCoordPointer > n i i i *' & (15!:0)
glTexEnvf=: ' glTexEnvf > n i i f' & (15!:0)
glTexEnvfv=: ' glTexEnvfv > n i i *f' & (15!:0)
glTexEnvi=: ' glTexEnvi > n i i i' & (15!:0)
glTexEnviv=: ' glTexEnviv > n i i *i' & (15!:0)
glTexGend=: ' glTexGend > n i i d' & (15!:0)
glTexGendv=: ' glTexGendv > n i i *d' & (15!:0)
glTexGeni=: ' glTexGeni > n i i i' & (15!:0)
glTexGeniv=: ' glTexGeniv > n i i *i' & (15!:0)
glTexImage1D=: ' glTexImage1D > n i i i i i i i *' & (15!:0)
glTexImage2D=: ' glTexImage2D > n i i i i i i i i *' & (15!:0)
glTexParameterf=: ' glTexParameterf > n i i f' & (15!:0)
glTexParameterfv=: ' glTexParameterfv > n i i *f' & (15!:0)
glTexParameteri=: ' glTexParameteri > n i i i' & (15!:0)
glTexParameteriv=: ' glTexParameteriv > n i i *i' & (15!:0)
glTexSubImage1D=: ' glTexSubImage1D > n i i i i i i *' & (15!:0)
glTexSubImage2D=: ' glTexSubImage2D > n i i i i i i i i *' & (15!:0)
glTranslated=: ' glTranslated > n d d d' & (15!:0)
glVertex2d=: ' glVertex2d > n d d' & (15!:0)
glVertex2dv=: ' glVertex2dv > n *d' & (15!:0)
glVertex2i=: ' glVertex2i > n i i' & (15!:0)
glVertex2iv=: ' glVertex2iv > n *i' & (15!:0)
glVertex3d=: ' glVertex3d > n d d d' & (15!:0)
glVertex3dv=: ' glVertex3dv > n *d' & (15!:0)
glVertex3i=: ' glVertex3i > n i i i' & (15!:0)
glVertex3iv=: ' glVertex3iv > n *i' & (15!:0)
glVertex4d=: ' glVertex4d > n d d d d' & (15!:0)
glVertex4dv=: ' glVertex4dv > n *d' & (15!:0)
glVertex4i=: ' glVertex4i > n i i i i' & (15!:0)
glVertex4iv=: ' glVertex4iv > n *i' & (15!:0)
glVertexPointer=: ' glVertexPointer > n i i i *' & (15!:0)
glViewport=: ' glViewport > n i i i i' & (15!:0)
)

NB. base names for common cases
glColor=: glColor4d
glMultMatrix=: glMultMatrixd @ <
glNormal=: glNormal3d
glRasterPos=: glRasterPos3d
glRect=: glRectd
glRotate=: glRotated
glScale=: glScaled
glTexCoord=: glTexCoord3d`glTexCoord4d @. (4 = {:@$)
glTranslate=: glTranslated
glVertex=: [:`[:`glVertex2d`glVertex3d`glVertex4d@.({:@$)

libglu f 0 : 0
gluBeginCurve=: ' gluBeginCurve > n *' & (15!:0)
gluBeginPolygon=: ' gluBeginPolygon > n *' & (15!:0)
gluBeginSurface=: ' gluBeginSurface > n *' & (15!:0)
gluBeginTrim=: ' gluBeginTrim > n *' & (15!:0)
gluBuild1DMipmaps=: ' gluBuild1DMipmaps > i i i i i i *' & (15!:0)
gluBuild2DMipmaps=: ' gluBuild2DMipmaps > i i i i i i i *' & (15!:0)
gluCylinder=: ' gluCylinder > n i d d d i i' & (15!:0)
gluDeleteNurbsRenderer=: ' gluDeleteNurbsRenderer > n *' & (15!:0)
gluDeleteQuadric=: ' gluDeleteQuadric > n i' & (15!:0)
gluDeleteTess=: ' gluDeleteTess > n *' & (15!:0)
gluDisk=: ' gluDisk > n i d d i i' & (15!:0)
gluEndCurve=: ' gluEndCurve > n *' & (15!:0)
gluEndPolygon=: ' gluEndPolygon > n *' & (15!:0)
gluEndSurface=: ' gluEndSurface > n *' & (15!:0)
gluEndTrim=: ' gluEndTrim > n *' & (15!:0)
gluErrorString=: ' gluErrorString *c i' & (15!:0)
gluErrorUnicodeStringEXT=: ' gluErrorUnicodeStringEXT *w i' & (15!:0)
gluGetNurbsProperty=: ' gluGetNurbsProperty > n * i *f' & (15!:0)
gluGetString=: ' gluGetString *c i' & (15!:0)
gluGetTessProperty=: ' gluGetTessProperty > n * i *d' & (15!:0)
gluLoadSamplingMatrices=: ' gluLoadSamplingMatrices > n * *f *f *i' & (15!:0)
gluLookAt=: ' gluLookAt > n d d d d d d d d d' & (15!:0)
gluNewNurbsRenderer=: ' gluNewNurbsRenderer *' & (15!:0)
gluNewQuadric=: ' gluNewQuadric *' & (15!:0)
gluNewTess=: ' gluNewTess *' & (15!:0)
gluNextContour=: ' gluNextContour > n * i' & (15!:0)
gluNurbsCallback=: ' gluNurbsCallback > n * i' & (15!:0)
gluNurbsCurve=: ' gluNurbsCurve > n * i *f i *f i i' & (15!:0)
gluNurbsProperty=: ' gluNurbsProperty > n * i f' & (15!:0)
gluNurbsSurface=: ' gluNurbsSurface > n * i *f i *f i i *f i i i' & (15!:0)
gluOrtho2D=: ' gluOrtho2D > n d d d d' & (15!:0)
gluPartialDisk=: ' gluPartialDisk > n i d d i i d d' & (15!:0)
gluPerspective=: ' gluPerspective > n d d d d' & (15!:0)
gluPickMatrix=: ' gluPickMatrix > n d d d d *i' & (15!:0)
gluProject=: ' gluProject > i d d d *d *d *i *d *d *d' & (15!:0)
gluPwlCurve=: ' gluPwlCurve > n * i *f i i' & (15!:0)
gluQuadricCallback=: ' gluQuadricCallback > n i i' & (15!:0)
gluQuadricDrawStyle=: ' gluQuadricDrawStyle > n i i' & (15!:0)
gluQuadricNormals=: ' gluQuadricNormals > n i i' & (15!:0)
gluQuadricOrientation=: ' gluQuadricOrientation > n i i' & (15!:0)
gluQuadricTexture=: ' gluQuadricTexture > n i c' & (15!:0)
gluScaleImage=: ' gluScaleImage > i i i i i * i i i *' & (15!:0)
gluSphere=: ' gluSphere > n i d i i' & (15!:0)
gluTessBeginContour=: ' gluTessBeginContour > n *' & (15!:0)
gluTessBeginPolygon=: ' gluTessBeginPolygon > n * *' & (15!:0)
gluTessCallback=: ' gluTessCallback > n * i' & (15!:0)
gluTessEndContour=: ' gluTessEndContour > n *' & (15!:0)
gluTessEndPolygon=: ' gluTessEndPolygon > n *' & (15!:0)
gluTessNormal=: ' gluTessNormal > n * d d d' & (15!:0)
gluTessProperty=: ' gluTessProperty > n * i d' & (15!:0)
gluTessVertex=: ' gluTessVertex > n * *d *' & (15!:0)
gluUnProject=: ' gluUnProject > i d d d *d *d *i *d *d *d' & (15!:0)
)

NB. gla helpers for calls with args that aren't lists of scalars
glaBitmap=: 3 : 'glBitmap (;/>0{y),1{y'
glaDrawPixels=: 3 : 'glDrawPixels (;/>0{y),1{y'
glaFog=: 3 : 'glFogfv ({.y);4{.}.y'
glaLight=: 3 : 'glLightfv (0{y);(1{y);4{.2}.y'
glaMap1=: 3 : 'glMap1d (;/5{.y),<5}.y'
glaMap2=: 3 : 'glMap2d (;/9{.y),<9}.y'
glaMaterial=: 3 : 'glMaterialfv (0{y);(1{y);<4{.2}.y'
glaSelectBuffer=: 3 : 'glSelectBuffer ({.y);<<{:y'
glaTexImage=: 3 : 'glTexImage2D (;/8{.y),<8}.y'

glaCallLists=: 3 : 0
if. 2 = 3!:0 y do.
  t=. GL_UNSIGNED_BYTE
  y=. ,y
else.
  y=. <. ,y + 2-2
  t=. GL_UNSIGNED_INT
end.
glCallLists (#y);t;y
)

glaChars=: 4 : 0
t=. y i.~32}.127{.a.
for_a. t do.
  'w h d'=. x{~>a
  glBitmap w;h;0;0;w;0;d
end.
)

NB. y is fontspec - 'arial 16'
NB. glaCreateBitmapFont=: 3 : 0
NB. wd'pc a;xywh 0 0 500 500;cc g isigraph;'
NB. alph=: 32}.127{.a.
NB. f=. 0 3$0
NB. for_a. alph do.
NB.   glclear ''
NB.   glfont y
NB.   gltext >a
NB.   'w h'=. glqextent >a
NB.   r=. glqpixels 0 0,w,h
NB.   d=. |."2 (h,w)$r=0
NB.   d=. (w+8|8-8|w){."1 d
NB.   f=. f,w;h;a.{~,_8 #.\"1 d
NB. end.
NB. wd'pclose'
NB. f
NB. )

glaReadPixels=: 3 : 0
size=. 4 * */ 2 3 { y
7 pick glReadPixels (;/y),<size$' '
)

gluaPickMatrix=: 3 : 'gluPickMatrix (;/4{.y),<4{.4}.y'

NB. workaround for Linux64
NB. http://www.opengl.org/sdk/docs/man/xhtml/gluLookAt.xml
NB.
NB. definiton of cross product from labs/livetexts/linearalgebra.ijt
NB. rl=: 1&|.                                   NB. rotate to left
NB. rr=: _1&|.                                  NB. rotate to right
NB. cross=: (rl@:[ * rr@:]) - (rr@:[ * rl@:])   NB. cross product
gluLookAtEmu=: 3 : 0
'eye center up'=. _3]\,>y
F=. center - eye
f=. (% +/&.:*:)F
UPP=. (% +/&.:*:)up
s=. f ((1&|.@:[ * _1&|.@:]) - _1&|.@:[ * 1&|.@:]) UPP
u=. s ((1&|.@:[ * _1&|.@:]) - _1&|.@:[ * 1&|.@:]) f
M=. _4]\ s, 0, u, 0, (-f), 0 0 0 0 1 
glMultMatrixd <,@:|: M
glTranslated -eye
)

3 : 0''
if. IF64 *. IFUNIX do.
  gluLookAt=: gluLookAtEmu
end.
''
)
