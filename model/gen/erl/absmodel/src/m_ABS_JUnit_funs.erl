-module(m_ABS_JUnit_funs).
-compile(export_all).
-include_lib("../include/abs_types.hrl").

'f_iterate'(Cog=#cog{ref=CogRef},V_tcs_0,Stack)->
    begin
        case V_tcs_0 of
            
            []-><<""/utf8>>;
            [V_tc_0 | V_rest_0]->iolist_to_binary([m_ABS_JUnit_funs:f_render(Cog,V_tc_0,Stack), m_ABS_JUnit_funs:f_iterate(Cog,V_rest_0,Stack)]);
            _ -> io:format("No match for tcs at abs/lang/abslang.abs:1353~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_render'(Cog=#cog{ref=CogRef},V_tc_0,Stack)->
    (fun (V_res_0)->iolist_to_binary([iolist_to_binary([iolist_to_binary([begin
        case m_ABS_JUnit_funs:f_result(Cog,V_tc_0,Stack) of
            
            dataPassed->V_res_0;
            dataSkipped->iolist_to_binary([V_res_0, <<"<skipped />
"/utf8>>]);
            {dataError,V_msg_0}->iolist_to_binary([iolist_to_binary([iolist_to_binary([V_res_0, <<"<error message=\""/utf8>>]), V_msg_0]), <<"\" />
"/utf8>>]);
            {dataFailure,V_msg_1}->iolist_to_binary([iolist_to_binary([iolist_to_binary([V_res_0, <<"<failure message=\""/utf8>>]), V_msg_1]), <<"\" />
"/utf8>>]);
            _ -> io:format("No match for FnApp(tc) at abs/lang/abslang.abs:1360~n"), 
            exit(dataPatternMatchFailException)
        end
    end, begin
        case m_ABS_JUnit_funs:f_stdout(Cog,V_tc_0,Stack) of
            
            dataNothing-><<""/utf8>>;
            {dataJust,V_msg_1}->iolist_to_binary([iolist_to_binary([<<"<system-out>
"/utf8>>, V_msg_1]), <<"
</system-out>
"/utf8>>]);
            _ -> io:format("No match for FnApp(tc) at abs/lang/abslang.abs:1367~n"), 
            exit(dataPatternMatchFailException)
        end
    end]), begin
        case m_ABS_JUnit_funs:f_stderr(Cog,V_tc_0,Stack) of
            
            dataNothing-><<""/utf8>>;
            {dataJust,V_msg_1}->iolist_to_binary([iolist_to_binary([<<"<system-err>
"/utf8>>, V_msg_1]), <<"
</system-err>
"/utf8>>]);
            _ -> io:format("No match for FnApp(tc) at abs/lang/abslang.abs:1371~n"), 
            exit(dataPatternMatchFailException)
        end
    end]), <<"</testcase>
"/utf8>>]) end(iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"<testcase name=\""/utf8>>, m_ABS_JUnit_funs:f_tcname(Cog,V_tc_0,Stack)]), <<"\" classname=\""/utf8>>]), m_ABS_JUnit_funs:f_tcclassname(Cog,V_tc_0,Stack)]), <<"\">
"/utf8>>]))).

'f_writeTestsuites'(Cog=#cog{ref=CogRef},V_tss_0,Stack)->
    iolist_to_binary([iolist_to_binary([<<"<?xml version=\"1.0\" encoding=\"UTF-8\" ?>
<testsuites>
"/utf8>>, m_ABS_JUnit_funs:f_iterateTS(Cog,m_ABS_JUnit_funs:f_ttss(Cog,V_tss_0,Stack),Stack)]), <<"</testsuites>"/utf8>>]).

'f_iterateTS'(Cog=#cog{ref=CogRef},V_tss_0,Stack)->
    begin
        case V_tss_0 of
            
            []-><<""/utf8>>;
            [V_ts_0 | V_rest_0]->iolist_to_binary([m_ABS_JUnit_funs:f_writeWithHeader(Cog,false,V_ts_0,Stack), m_ABS_JUnit_funs:f_iterateTS(Cog,V_rest_0,Stack)]);
            _ -> io:format("No match for tss at abs/lang/abslang.abs:1383~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_writeTestsuite'(Cog=#cog{ref=CogRef},V_ts_0,Stack)->
    m_ABS_JUnit_funs:f_writeWithHeader(Cog,true,V_ts_0,Stack).

'f_writeWithHeader'(Cog=#cog{ref=CogRef},V_withHeader_0,V_ts_0,Stack)->
    case V_withHeader_0 of
        true -> <<"<?xml version=\"1.0\" encoding=\"UTF-8\" ?>
"/utf8>>;
        false -> iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"<testsuite name=\""/utf8>>, m_ABS_JUnit_funs:f_name(Cog,V_ts_0,Stack)]), <<"\" tests=\""/utf8>>]), builtin:toString(Cog,m_ABS_StdLib_funs:f_length(Cog,m_ABS_JUnit_funs:f_tcs(Cog,V_ts_0,Stack),Stack))]), <<"\">
"/utf8>>]), m_ABS_JUnit_funs:f_iterate(Cog,m_ABS_JUnit_funs:f_tcs(Cog,V_ts_0,Stack),Stack)]), <<"</testsuite>
"/utf8>>])
    end.

'f_ttss'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestsuites,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1347~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_isNamed'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestsuites,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1347~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_tcs'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestsuite,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1348~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_name'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestsuite,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1348~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_result'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestcase,_,_,V_res_0,_,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1350~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_tcname'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestcase,V_res_0,_,_,_,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1350~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_stdout'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestcase,_,_,_,V_res_0,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1350~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_tcclassname'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestcase,_,V_res_0,_,_,_}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1350~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

'f_stderr'(Cog=#cog{ref=CogRef},V_data_0,Stack)->
    begin
        case V_data_0 of
            
            {dataTestcase,_,_,_,_,V_res_0}->V_res_0;
            _ -> io:format("No match for data at abs/lang/abslang.abs:1350~n"), 
            exit(dataPatternMatchFailException)
        end
    end.

