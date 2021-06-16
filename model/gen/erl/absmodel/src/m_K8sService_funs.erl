-module(m_K8sService_funs).
-compile(export_all).
-include_lib("../include/abs_types.hrl").

'f_map_ABS_StdLib_Anon0__'(Cog=#cog{ref=CogRef},V_list_0,Stack)->
    begin
        case V_list_0 of
            
            []->[];
            [V_x1111111111_0 | V_xs1111111111_0]->[(fun (V_a_0)->V_a_0 end(V_x1111111111_0)) | m_K8sService_funs:f_map_ABS_StdLib_Anon0__(Cog,V_xs1111111111_0,Stack)];
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_map_ABS_StdLib_Anon1__'(Cog=#cog{ref=CogRef},V_list_0,Stack)->
    begin
        case V_list_0 of
            
            []->[];
            [V_x1111111111_0 | V_xs1111111111_0]->[(fun (V_a_0)->V_a_0 end(V_x1111111111_0)) | m_K8sService_funs:f_map_ABS_StdLib_Anon1__(Cog,V_xs1111111111_0,Stack)];
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_foldl_ABS_StdLib_Anon2__'(Cog=#cog{ref=CogRef},V_list_0,V_val_0,Stack)->
    begin
        case V_list_0 of
            
            []->V_val_0;
            [V_x1111111111_0 | V_xs1111111111_0]->m_K8sService_funs:f_foldl_ABS_StdLib_Anon2__(Cog,V_xs1111111111_0,(fun (V_b_0)->(fun (V_a_0)->(V_b_0 + V_a_0)  end(V_x1111111111_0)) end(V_val_0)),Stack);
            _ -> io:format("No match for list at abs/lang/abslang.abs:0~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

