-module(m_ABS_Productline_funs).
-compile(export_all).
-include_lib("../include/abs_types.hrl").

'f_product_name'(Cog=#cog{ref=CogRef},Stack)->
    <<""/utf8>>.

'f_product_features'(Cog=#cog{ref=CogRef},Stack)->
    [].

