-module(class_ABS_DC_DeploymentComponent).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"DeploymentComponentForCloudProvider">>, <<"DeploymentComponent">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_ABS_DC_DeploymentComponent,'description'=null,'initconfig'=null,'cpuhistory'=null,'cpuhistorytotal'=null,'bwhistory'=null,'bwhistorytotal'=null,'memoryhistory'=null,'memoryhistorytotal'=null,'cpuconsumed'=null,'bwconsumed'=null,'memoryconsumed'=null,'creationTime'=null,'shutdownTime'=null,'initialized'=null,'is_shutdown'=null,'cpu'=null,'cpunext'=null,'bw'=null,'bwnext'=null,'memory'=null,'memorynext'=null,'paymentInterval'=null,'costPerInterval'=null,'startupDuration'=null,'shutdownDuration'=null,'numberOfCores'=null,'cloudprovider'=null}).
'init_internal'()->
    #state{}.

 %% abs/lang/abslang.abs:1005
'get_val_internal'(#state{'description'=G},'description')->
    G;
 %% abs/lang/abslang.abs:1005
'get_val_internal'(#state{'initconfig'=G},'initconfig')->
    G;
 %% abs/lang/abslang.abs:1015
'get_val_internal'(#state{'cpuhistory'=G},'cpuhistory')->
    G;
 %% abs/lang/abslang.abs:1016
'get_val_internal'(#state{'cpuhistorytotal'=G},'cpuhistorytotal')->
    G;
 %% abs/lang/abslang.abs:1017
'get_val_internal'(#state{'bwhistory'=G},'bwhistory')->
    G;
 %% abs/lang/abslang.abs:1018
'get_val_internal'(#state{'bwhistorytotal'=G},'bwhistorytotal')->
    G;
 %% abs/lang/abslang.abs:1019
'get_val_internal'(#state{'memoryhistory'=G},'memoryhistory')->
    G;
 %% abs/lang/abslang.abs:1020
'get_val_internal'(#state{'memoryhistorytotal'=G},'memoryhistorytotal')->
    G;
 %% abs/lang/abslang.abs:1026
'get_val_internal'(#state{'cpuconsumed'=G},'cpuconsumed')->
    G;
 %% abs/lang/abslang.abs:1027
'get_val_internal'(#state{'bwconsumed'=G},'bwconsumed')->
    G;
 %% abs/lang/abslang.abs:1028
'get_val_internal'(#state{'memoryconsumed'=G},'memoryconsumed')->
    G;
 %% abs/lang/abslang.abs:1032
'get_val_internal'(#state{'creationTime'=G},'creationTime')->
    G;
 %% abs/lang/abslang.abs:1033
'get_val_internal'(#state{'shutdownTime'=G},'shutdownTime')->
    G;
 %% abs/lang/abslang.abs:1037
'get_val_internal'(#state{'initialized'=G},'initialized')->
    G;
 %% abs/lang/abslang.abs:1040
'get_val_internal'(#state{'is_shutdown'=G},'is_shutdown')->
    G;
 %% abs/lang/abslang.abs:1042
'get_val_internal'(#state{'cpu'=G},'cpu')->
    G;
 %% abs/lang/abslang.abs:1044
'get_val_internal'(#state{'cpunext'=G},'cpunext')->
    G;
 %% abs/lang/abslang.abs:1045
'get_val_internal'(#state{'bw'=G},'bw')->
    G;
 %% abs/lang/abslang.abs:1047
'get_val_internal'(#state{'bwnext'=G},'bwnext')->
    G;
 %% abs/lang/abslang.abs:1048
'get_val_internal'(#state{'memory'=G},'memory')->
    G;
 %% abs/lang/abslang.abs:1050
'get_val_internal'(#state{'memorynext'=G},'memorynext')->
    G;
 %% abs/lang/abslang.abs:1051
'get_val_internal'(#state{'paymentInterval'=G},'paymentInterval')->
    G;
 %% abs/lang/abslang.abs:1054
'get_val_internal'(#state{'costPerInterval'=G},'costPerInterval')->
    G;
 %% abs/lang/abslang.abs:1055
'get_val_internal'(#state{'startupDuration'=G},'startupDuration')->
    G;
 %% abs/lang/abslang.abs:1056
'get_val_internal'(#state{'shutdownDuration'=G},'shutdownDuration')->
    G;
 %% abs/lang/abslang.abs:1057
'get_val_internal'(#state{'numberOfCores'=G},'numberOfCores')->
    G;
 %% abs/lang/abslang.abs:1059
'get_val_internal'(#state{'cloudprovider'=G},'cloudprovider')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% abs/lang/abslang.abs:1005
'set_val_internal'(S,'description',V)->
    S#state{'description'=V};
 %% abs/lang/abslang.abs:1005
'set_val_internal'(S,'initconfig',V)->
    S#state{'initconfig'=V};
 %% abs/lang/abslang.abs:1015
'set_val_internal'(S,'cpuhistory',V)->
    S#state{'cpuhistory'=V};
 %% abs/lang/abslang.abs:1016
'set_val_internal'(S,'cpuhistorytotal',V)->
    S#state{'cpuhistorytotal'=V};
 %% abs/lang/abslang.abs:1017
'set_val_internal'(S,'bwhistory',V)->
    S#state{'bwhistory'=V};
 %% abs/lang/abslang.abs:1018
'set_val_internal'(S,'bwhistorytotal',V)->
    S#state{'bwhistorytotal'=V};
 %% abs/lang/abslang.abs:1019
'set_val_internal'(S,'memoryhistory',V)->
    S#state{'memoryhistory'=V};
 %% abs/lang/abslang.abs:1020
'set_val_internal'(S,'memoryhistorytotal',V)->
    S#state{'memoryhistorytotal'=V};
 %% abs/lang/abslang.abs:1026
'set_val_internal'(S,'cpuconsumed',V)->
    S#state{'cpuconsumed'=V};
 %% abs/lang/abslang.abs:1027
'set_val_internal'(S,'bwconsumed',V)->
    S#state{'bwconsumed'=V};
 %% abs/lang/abslang.abs:1028
'set_val_internal'(S,'memoryconsumed',V)->
    S#state{'memoryconsumed'=V};
 %% abs/lang/abslang.abs:1032
'set_val_internal'(S,'creationTime',V)->
    S#state{'creationTime'=V};
 %% abs/lang/abslang.abs:1033
'set_val_internal'(S,'shutdownTime',V)->
    S#state{'shutdownTime'=V};
 %% abs/lang/abslang.abs:1037
'set_val_internal'(S,'initialized',V)->
    S#state{'initialized'=V};
 %% abs/lang/abslang.abs:1040
'set_val_internal'(S,'is_shutdown',V)->
    S#state{'is_shutdown'=V};
 %% abs/lang/abslang.abs:1042
'set_val_internal'(S,'cpu',V)->
    S#state{'cpu'=V};
 %% abs/lang/abslang.abs:1044
'set_val_internal'(S,'cpunext',V)->
    S#state{'cpunext'=V};
 %% abs/lang/abslang.abs:1045
'set_val_internal'(S,'bw',V)->
    S#state{'bw'=V};
 %% abs/lang/abslang.abs:1047
'set_val_internal'(S,'bwnext',V)->
    S#state{'bwnext'=V};
 %% abs/lang/abslang.abs:1048
'set_val_internal'(S,'memory',V)->
    S#state{'memory'=V};
 %% abs/lang/abslang.abs:1050
'set_val_internal'(S,'memorynext',V)->
    S#state{'memorynext'=V};
 %% abs/lang/abslang.abs:1051
'set_val_internal'(S,'paymentInterval',V)->
    S#state{'paymentInterval'=V};
 %% abs/lang/abslang.abs:1054
'set_val_internal'(S,'costPerInterval',V)->
    S#state{'costPerInterval'=V};
 %% abs/lang/abslang.abs:1055
'set_val_internal'(S,'startupDuration',V)->
    S#state{'startupDuration'=V};
 %% abs/lang/abslang.abs:1056
'set_val_internal'(S,'shutdownDuration',V)->
    S#state{'shutdownDuration'=V};
 %% abs/lang/abslang.abs:1057
'set_val_internal'(S,'numberOfCores',V)->
    S#state{'numberOfCores'=V};
 %% abs/lang/abslang.abs:1059
'set_val_internal'(S,'cloudprovider',V)->
    S#state{'cloudprovider'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'description', S#state.'description' }
        , { 'initconfig', S#state.'initconfig' }
        , { 'cpuhistory', S#state.'cpuhistory' }
        , { 'cpuhistorytotal', S#state.'cpuhistorytotal' }
        , { 'bwhistory', S#state.'bwhistory' }
        , { 'bwhistorytotal', S#state.'bwhistorytotal' }
        , { 'memoryhistory', S#state.'memoryhistory' }
        , { 'memoryhistorytotal', S#state.'memoryhistorytotal' }
        , { 'cpuconsumed', S#state.'cpuconsumed' }
        , { 'bwconsumed', S#state.'bwconsumed' }
        , { 'memoryconsumed', S#state.'memoryconsumed' }
        , { 'creationTime', S#state.'creationTime' }
        , { 'shutdownTime', S#state.'shutdownTime' }
        , { 'initialized', S#state.'initialized' }
        , { 'is_shutdown', S#state.'is_shutdown' }
        , { 'cpu', S#state.'cpu' }
        , { 'cpunext', S#state.'cpunext' }
        , { 'bw', S#state.'bw' }
        , { 'bwnext', S#state.'bwnext' }
        , { 'memory', S#state.'memory' }
        , { 'memorynext', S#state.'memorynext' }
        , { 'paymentInterval', S#state.'paymentInterval' }
        , { 'costPerInterval', S#state.'costPerInterval' }
        , { 'startupDuration', S#state.'startupDuration' }
        , { 'shutdownDuration', S#state.'shutdownDuration' }
        , { 'numberOfCores', S#state.'numberOfCores' }
        , { 'cloudprovider', S#state.'cloudprovider' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_description,P_initconfig,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'description',P_description)),
    put(this, C:set_val_internal(get(this),'initconfig',P_initconfig)),
     %% abs/lang/abslang.abs:1015--1015
    put(this, C:set_val_internal(get(this),'cpuhistory',[])),
     %% abs/lang/abslang.abs:1016--1016
    put(this, C:set_val_internal(get(this),'cpuhistorytotal',[])),
     %% abs/lang/abslang.abs:1017--1017
    put(this, C:set_val_internal(get(this),'bwhistory',[])),
     %% abs/lang/abslang.abs:1018--1018
    put(this, C:set_val_internal(get(this),'bwhistorytotal',[])),
     %% abs/lang/abslang.abs:1019--1019
    put(this, C:set_val_internal(get(this),'memoryhistory',[])),
     %% abs/lang/abslang.abs:1020--1020
    put(this, C:set_val_internal(get(this),'memoryhistorytotal',[])),
     %% abs/lang/abslang.abs:1026--1026
    put(this, C:set_val_internal(get(this),'cpuconsumed',0)),
     %% abs/lang/abslang.abs:1027--1027
    put(this, C:set_val_internal(get(this),'bwconsumed',0)),
     %% abs/lang/abslang.abs:1028--1028
    put(this, C:set_val_internal(get(this),'memoryconsumed',0)),
     %% abs/lang/abslang.abs:1032--1032
    put(this, C:set_val_internal(get(this),'creationTime',m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1033--1033
    put(this, C:set_val_internal(get(this),'shutdownTime',dataNothing)),
     %% abs/lang/abslang.abs:1037--1037
    put(this, C:set_val_internal(get(this),'initialized',false)),
     %% abs/lang/abslang.abs:1040--1040
    put(this, C:set_val_internal(get(this),'is_shutdown',false)),
     %% abs/lang/abslang.abs:1042--1043
    put(this, C:set_val_internal(get(this),'cpu',begin
        case m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'initconfig'),dataSpeed,[O,DC| Stack]) of
            
            dataNothing->dataInfRat;
            {dataJust,V_v_0}->{ dataFin,V_v_0};
            _ -> io:format("No match for FnApp(initconfig,Speed()) at abs/lang/abslang.abs:1042~n"), 
            exit(dataPatternMatchFailException)
        end
    end)),
     %% abs/lang/abslang.abs:1044--1044
    put(this, C:set_val_internal(get(this),'cpunext',C:get_val_internal(get(this), 'cpu'))),
     %% abs/lang/abslang.abs:1045--1046
    put(this, C:set_val_internal(get(this),'bw',begin
        case m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'initconfig'),dataBandwidth,[O,DC| Stack]) of
            
            dataNothing->dataInfRat;
            {dataJust,V_v_1}->{ dataFin,V_v_1};
            _ -> io:format("No match for FnApp(initconfig,Bandwidth()) at abs/lang/abslang.abs:1045~n"), 
            exit(dataPatternMatchFailException)
        end
    end)),
     %% abs/lang/abslang.abs:1047--1047
    put(this, C:set_val_internal(get(this),'bwnext',C:get_val_internal(get(this), 'bw'))),
     %% abs/lang/abslang.abs:1048--1049
    put(this, C:set_val_internal(get(this),'memory',begin
        case m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'initconfig'),dataMemory,[O,DC| Stack]) of
            
            dataNothing->dataInfRat;
            {dataJust,V_m_0}->{ dataFin,V_m_0};
            _ -> io:format("No match for FnApp(initconfig,Memory()) at abs/lang/abslang.abs:1048~n"), 
            exit(dataPatternMatchFailException)
        end
    end)),
     %% abs/lang/abslang.abs:1050--1050
    put(this, C:set_val_internal(get(this),'memorynext',C:get_val_internal(get(this), 'memory'))),
     %% abs/lang/abslang.abs:1051--1053
    put(this, C:set_val_internal(get(this),'paymentInterval',begin
        case m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'initconfig'),dataPaymentInterval,[O,DC| Stack]) of
            
            dataNothing->1;
            {dataJust,V_n_0}->builtin:truncate(Cog,V_n_0);
            _ -> io:format("No match for FnApp(initconfig,PaymentInterval()) at abs/lang/abslang.abs:1052~n"), 
            exit(dataPatternMatchFailException)
        end
    end)),
     %% abs/lang/abslang.abs:1054--1054
    put(this, C:set_val_internal(get(this),'costPerInterval',m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'initconfig'),dataCostPerInterval, rationals:rdiv(0,1) ,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1055--1055
    put(this, C:set_val_internal(get(this),'startupDuration',m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'initconfig'),dataStartupduration, rationals:rdiv(0,1) ,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1056--1056
    put(this, C:set_val_internal(get(this),'shutdownDuration',m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'initconfig'),dataShutdownduration, rationals:rdiv(0,1) ,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1057--1057
    put(this, C:set_val_internal(get(this),'numberOfCores',m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'initconfig'),dataCores, rationals:rdiv(1,1) ,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1059--1059
    put(this, C:set_val_internal(get(this),'cloudprovider',null)),
     %% abs/lang/abslang.abs:1061--1061
    put(this, C:set_val_internal(get(this), 'initialized',true)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% abs/lang/abslang.abs:1063
 %% abs/lang/abslang.abs:1063
'm_load'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_rtype_0,V_periods_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'rtype' => V_rtype_0,
 'periods' => V_periods_0 }),
    try
         %% abs/lang/abslang.abs:1064--1064
        put(vars, (get(vars))#{'result' => 0}),
         %% abs/lang/abslang.abs:1065--1065
        case maps:get('rtype', get(vars)) of
            dataSpeed->
                 %% abs/lang/abslang.abs:1067--1067
                case (not cmp:eq(C:get_val_internal(get(this), 'cpu'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1068--1068
                    put(vars, (get(vars))#{'result' := m_ABS_DC_funs:f_averageDivsN(Cog,C:get_val_internal(get(this), 'cpuhistory'),C:get_val_internal(get(this), 'cpuhistorytotal'),maps:get('periods', get(vars)),[O,DC| Stack])});
                    false ->                 ok
                end;
            dataBandwidth->
                 %% abs/lang/abslang.abs:1072--1072
                case (not cmp:eq(C:get_val_internal(get(this), 'bw'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1073--1073
                    put(vars, (get(vars))#{'result' := m_ABS_DC_funs:f_averageDivsN(Cog,C:get_val_internal(get(this), 'bwhistory'),C:get_val_internal(get(this), 'bwhistorytotal'),maps:get('periods', get(vars)),[O,DC| Stack])});
                    false ->                 ok
                end;
            dataMemory->
                 %% abs/lang/abslang.abs:1077--1077
                case (not cmp:eq(C:get_val_internal(get(this), 'memory'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1078--1078
                    put(vars, (get(vars))#{'result' := m_ABS_DC_funs:f_averageDivsN(Cog,C:get_val_internal(get(this), 'memoryhistory'),C:get_val_internal(get(this), 'memoryhistorytotal'),maps:get('periods', get(vars)),[O,DC| Stack])});
                    false ->                 ok
                end;
            _->
                 %% abs/lang/abslang.abs:1065--1081
                throw(dataPatternMatchFailException)
        end,
         %% abs/lang/abslang.abs:1082--1082
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method load and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1084
 %% abs/lang/abslang.abs:1084
'm_total'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_rtype_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'rtype' => V_rtype_0 }),
    try
         %% abs/lang/abslang.abs:1085--1085
        put(vars, (get(vars))#{'result' => dataInfRat}),
         %% abs/lang/abslang.abs:1086--1086
        case maps:get('rtype', get(vars)) of
            dataSpeed->
                 %% abs/lang/abslang.abs:1087--1087
                put(vars, (get(vars))#{'result' := C:get_val_internal(get(this), 'cpu')});
            dataBandwidth->
                 %% abs/lang/abslang.abs:1088--1088
                put(vars, (get(vars))#{'result' := C:get_val_internal(get(this), 'bw')});
            dataMemory->
                 %% abs/lang/abslang.abs:1089--1089
                put(vars, (get(vars))#{'result' := C:get_val_internal(get(this), 'memory')});
            _->
                 %% abs/lang/abslang.abs:1086--1090
                throw(dataPatternMatchFailException)
        end,
         %% abs/lang/abslang.abs:1091--1091
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method total and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1097
 %% abs/lang/abslang.abs:1097
'm_transfer'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_target_0,V_amount_0,V_rtype_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'target' => V_target_0,
 'amount' => V_amount_0,
 'rtype' => V_rtype_0 }),
    try
         %% abs/lang/abslang.abs:1098--1098
        put(vars, (get(vars))#{'amount' := (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_decrementResources'(Callee,maps:get('amount', get(vars)),maps:get('rtype', get(vars)),[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                V_amount = maps:get('amount', get(vars)),
                V_rtype = maps:get('rtype', get(vars)),
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_decrementResources'(Callee, V_amount, V_rtype,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_decrementResources',[maps:get('amount', get(vars)),maps:get('rtype', get(vars)),[]],#task_info{method= <<"decrementResources"/utf8>>},Cog, true),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)()}),
         %% abs/lang/abslang.abs:1099--1099
        T_1 = cog:create_task(maps:get('target', get(vars)),'m_incrementResources',[maps:get('amount', get(vars)),maps:get('rtype', get(vars)),[]],#task_info{method= <<"incrementResources"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
         %% abs/lang/abslang.abs:1100--1100
        maps:get('amount', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method transfer and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1103
 %% abs/lang/abslang.abs:1103
'm_decrementResources'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,V_rtype_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'amount' => V_amount_0,
 'rtype' => V_rtype_0 }),
    try
         %% abs/lang/abslang.abs:1104--1104
        case maps:get('rtype', get(vars)) of
            dataSpeed->
                 %% abs/lang/abslang.abs:1105--1105
                case (not cmp:eq(C:get_val_internal(get(this), 'cpunext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1106--1106
                    put(vars, (get(vars))#{'amount' := m_ABS_StdLib_funs:f_min(Cog,maps:get('amount', get(vars)),m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'cpunext'),[O,DC| Stack]),[O,DC| Stack])}),
                     %% abs/lang/abslang.abs:1107--1107
                    put(this, C:set_val_internal(get(this), 'cpunext',{ dataFin,( rationals:sub(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'cpunext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            dataBandwidth->
                 %% abs/lang/abslang.abs:1109--1109
                case (not cmp:eq(C:get_val_internal(get(this), 'bwnext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1110--1110
                    put(vars, (get(vars))#{'amount' := m_ABS_StdLib_funs:f_min(Cog,maps:get('amount', get(vars)),m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'bwnext'),[O,DC| Stack]),[O,DC| Stack])}),
                     %% abs/lang/abslang.abs:1111--1111
                    put(this, C:set_val_internal(get(this), 'bwnext',{ dataFin,( rationals:sub(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'bwnext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            dataMemory->
                 %% abs/lang/abslang.abs:1113--1113
                case (not cmp:eq(C:get_val_internal(get(this), 'memorynext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1114--1114
                    put(vars, (get(vars))#{'amount' := m_ABS_StdLib_funs:f_min(Cog,maps:get('amount', get(vars)),m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'memorynext'),[O,DC| Stack]),[O,DC| Stack])}),
                     %% abs/lang/abslang.abs:1115--1115
                    put(this, C:set_val_internal(get(this), 'memorynext',{ dataFin,( rationals:sub(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'memorynext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            _->
                 %% abs/lang/abslang.abs:1104--1117
                throw(dataPatternMatchFailException)
        end,
         %% abs/lang/abslang.abs:1118--1118
        maps:get('amount', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method decrementResources and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1120
 %% abs/lang/abslang.abs:1120
'm_incrementResources'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,V_rtype_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'amount' => V_amount_0,
 'rtype' => V_rtype_0 }),
    try
         %% abs/lang/abslang.abs:1121--1121
        case maps:get('rtype', get(vars)) of
            dataSpeed->
                 %% abs/lang/abslang.abs:1123--1123
                case (not cmp:eq(C:get_val_internal(get(this), 'cpunext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1124--1124
                    put(this, C:set_val_internal(get(this), 'cpunext',{ dataFin,( rationals:add(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'cpunext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            dataBandwidth->
                 %% abs/lang/abslang.abs:1127--1127
                case (not cmp:eq(C:get_val_internal(get(this), 'bwnext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1128--1128
                    put(this, C:set_val_internal(get(this), 'bwnext',{ dataFin,( rationals:add(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'bwnext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            dataMemory->
                 %% abs/lang/abslang.abs:1130--1130
                case (not cmp:eq(C:get_val_internal(get(this), 'memorynext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1131--1131
                    put(this, C:set_val_internal(get(this), 'memorynext',{ dataFin,( rationals:add(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'memorynext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            _->
                 %% abs/lang/abslang.abs:1121--1133
                throw(dataPatternMatchFailException)
        end,
         %% abs/lang/abslang.abs:1134--1134
        maps:get('amount', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method incrementResources and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1136
 %% abs/lang/abslang.abs:1136
'm_setProvider'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_provider_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'provider' => V_provider_0 }),
    try
         %% abs/lang/abslang.abs:1137--1137
        put(this, C:set_val_internal(get(this), 'cloudprovider',maps:get('provider', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setProvider and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1139
 %% abs/lang/abslang.abs:1139
'm_convertToDC'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1139--1139
        O
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method convertToDC and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1141
 %% abs/lang/abslang.abs:1141
'm_getProvider'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1141--1141
        C:get_val_internal(get(this), 'cloudprovider')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getProvider and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1142
 %% abs/lang/abslang.abs:1142
'm_acquire'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1143--1143
        put(vars, (get(vars))#{'result' => true}),
         %% abs/lang/abslang.abs:1144--1144
        case (not cmp:eq(C:get_val_internal(get(this), 'cloudprovider'),null)) of
            true ->  %% abs/lang/abslang.abs:1145--1145
            put(vars, (get(vars))#{'tmp1269530703' => cog:create_task(C:get_val_internal(get(this), 'cloudprovider'),'m_acquireInstance',[O,[]],#task_info{method= <<"acquireInstance"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
             %% abs/lang/abslang.abs:1145--1145
            future:await(maps:get('tmp1269530703', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% abs/lang/abslang.abs:1145--1145
            put(vars, (get(vars))#{'result' := future:get_blocking(maps:get('tmp1269530703', get(vars)), Cog, [O,DC| Stack])});
            false ->         ok
        end,
         %% abs/lang/abslang.abs:1147--1147
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method acquire and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1149
 %% abs/lang/abslang.abs:1149
'm_release'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1150--1150
        put(vars, (get(vars))#{'result' => true}),
         %% abs/lang/abslang.abs:1151--1151
        case (not cmp:eq(C:get_val_internal(get(this), 'cloudprovider'),null)) of
            true ->  %% abs/lang/abslang.abs:1152--1152
            put(vars, (get(vars))#{'tmp250337667' => cog:create_task(C:get_val_internal(get(this), 'cloudprovider'),'m_releaseInstance',[O,[]],#task_info{method= <<"releaseInstance"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
             %% abs/lang/abslang.abs:1152--1152
            future:await(maps:get('tmp250337667', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% abs/lang/abslang.abs:1152--1152
            put(vars, (get(vars))#{'result' := future:get_blocking(maps:get('tmp250337667', get(vars)), Cog, [O,DC| Stack])});
            false ->         ok
        end,
         %% abs/lang/abslang.abs:1154--1154
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method release and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1157
 %% abs/lang/abslang.abs:1157
'm_shutdown'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1158--1158
        case not (C:get_val_internal(get(this), 'is_shutdown')) of
            true ->  %% abs/lang/abslang.abs:1159--1159
            put(this, C:set_val_internal(get(this), 'is_shutdown',true)),
             %% abs/lang/abslang.abs:1160--1160
            put(this, C:set_val_internal(get(this), 'shutdownTime',{ dataJust,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack])})),
             %% abs/lang/abslang.abs:1161--1161
            case (not cmp:eq(C:get_val_internal(get(this), 'cloudprovider'),null)) of
                true ->  %% abs/lang/abslang.abs:1162--1162
                T_1 = cog:create_task(C:get_val_internal(get(this), 'cloudprovider'),'m_internalShutdownInstance',[O,[]],#task_info{method= <<"internalShutdownInstance"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                T_1;
                false ->             ok
            end;
            false ->         ok
        end,
         %% abs/lang/abslang.abs:1165--1165
        true
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method shutdown and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1168
 %% abs/lang/abslang.abs:1168
'm_getName'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1168--1168
        C:get_val_internal(get(this), 'description')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getName and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1169
 %% abs/lang/abslang.abs:1169
'm_getCreationTime'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1169--1169
        C:get_val_internal(get(this), 'creationTime')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getCreationTime and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1170
 %% abs/lang/abslang.abs:1170
'm_getStartupDuration'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1170--1170
        C:get_val_internal(get(this), 'startupDuration')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getStartupDuration and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1171
 %% abs/lang/abslang.abs:1171
'm_getShutdownDuration'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1171--1171
        C:get_val_internal(get(this), 'shutdownDuration')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getShutdownDuration and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1172
 %% abs/lang/abslang.abs:1172
'm_getPaymentInterval'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1172--1172
        C:get_val_internal(get(this), 'paymentInterval')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getPaymentInterval and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1173
 %% abs/lang/abslang.abs:1173
'm_getCostPerInterval'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1173--1173
        C:get_val_internal(get(this), 'costPerInterval')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getCostPerInterval and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1175
 %% abs/lang/abslang.abs:1175
'm_getAccumulatedCost'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1176--1176
        put(vars, (get(vars))#{'result' => 0}),
         %% abs/lang/abslang.abs:1177--1177
        case (cmp:gt(C:get_val_internal(get(this), 'costPerInterval'),0)) and (cmp:gt(C:get_val_internal(get(this), 'paymentInterval'),0)) of
            true ->  %% abs/lang/abslang.abs:1178--1178
            put(vars, (get(vars))#{'nIntervals' => builtin:truncate(Cog, rationals:rdiv(builtin:truncate(Cog,m_ABS_StdLib_funs:f_timeDifference(Cog,C:get_val_internal(get(this), 'creationTime'),m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack])),C:get_val_internal(get(this), 'paymentInterval')) )}),
             %% abs/lang/abslang.abs:1179--1179
            put(vars, (get(vars))#{'result' := ( rationals:mul(maps:get('nIntervals', get(vars)),C:get_val_internal(get(this), 'costPerInterval'))) });
            false ->         ok
        end,
         %% abs/lang/abslang.abs:1181--1181
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getAccumulatedCost and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1184
 %% abs/lang/abslang.abs:1184
'm_getNumberOfCores'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1184--1184
        C:get_val_internal(get(this), 'numberOfCores')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getNumberOfCores and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
