-module(class_K8sMaster_NodeObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Node">>, <<"Object">> ].

exported() -> #{ <<"getCpuTimeMap">> => { 'm_getCpuTimeMap', <<"ABS.StdLib.String">>, [ ] } }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sMaster_NodeObject,'id'=null,'cpu'=null,'memory'=null,'timeUnitSize'=null,'cycle'=null,'baseSystemCpuLoad'=null,'monitor'=null,'costGranularity'=null,'pMonitors'=null,'pods'=null,'name'=null,'refreshed'=null,'memoryLock'=null,'computing'=null,'sysLoadInterleaving'=null,'availableCpu'=null,'availableMemory'=null,'systemCpuLoad'=null,'requestedCpu'=null,'remainingSysLoadSteps'=null}).
'init_internal'()->
    #state{}.

 %% K8sMaster.abs:89
'get_val_internal'(#state{'id'=G},'id')->
    G;
 %% K8sMaster.abs:89
'get_val_internal'(#state{'cpu'=G},'cpu')->
    G;
 %% K8sMaster.abs:89
'get_val_internal'(#state{'memory'=G},'memory')->
    G;
 %% K8sMaster.abs:89
'get_val_internal'(#state{'timeUnitSize'=G},'timeUnitSize')->
    G;
 %% K8sMaster.abs:89
'get_val_internal'(#state{'cycle'=G},'cycle')->
    G;
 %% K8sMaster.abs:90
'get_val_internal'(#state{'baseSystemCpuLoad'=G},'baseSystemCpuLoad')->
    G;
 %% K8sMaster.abs:90
'get_val_internal'(#state{'monitor'=G},'monitor')->
    G;
 %% K8sMaster.abs:90
'get_val_internal'(#state{'costGranularity'=G},'costGranularity')->
    G;
 %% K8sMaster.abs:91
'get_val_internal'(#state{'pMonitors'=G},'pMonitors')->
    G;
 %% K8sMaster.abs:92
'get_val_internal'(#state{'pods'=G},'pods')->
    G;
 %% K8sMaster.abs:93
'get_val_internal'(#state{'name'=G},'name')->
    G;
 %% K8sMaster.abs:94
'get_val_internal'(#state{'refreshed'=G},'refreshed')->
    G;
 %% K8sMaster.abs:95
'get_val_internal'(#state{'memoryLock'=G},'memoryLock')->
    G;
 %% K8sMaster.abs:96
'get_val_internal'(#state{'computing'=G},'computing')->
    G;
 %% K8sMaster.abs:97
'get_val_internal'(#state{'sysLoadInterleaving'=G},'sysLoadInterleaving')->
    G;
 %% K8sMaster.abs:99
'get_val_internal'(#state{'availableCpu'=G},'availableCpu')->
    G;
 %% K8sMaster.abs:100
'get_val_internal'(#state{'availableMemory'=G},'availableMemory')->
    G;
 %% K8sMaster.abs:101
'get_val_internal'(#state{'systemCpuLoad'=G},'systemCpuLoad')->
    G;
 %% K8sMaster.abs:103
'get_val_internal'(#state{'requestedCpu'=G},'requestedCpu')->
    G;
 %% K8sMaster.abs:105
'get_val_internal'(#state{'remainingSysLoadSteps'=G},'remainingSysLoadSteps')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sMaster.abs:89
'set_val_internal'(S,'id',V)->
    S#state{'id'=V};
 %% K8sMaster.abs:89
'set_val_internal'(S,'cpu',V)->
    S#state{'cpu'=V};
 %% K8sMaster.abs:89
'set_val_internal'(S,'memory',V)->
    S#state{'memory'=V};
 %% K8sMaster.abs:89
'set_val_internal'(S,'timeUnitSize',V)->
    S#state{'timeUnitSize'=V};
 %% K8sMaster.abs:89
'set_val_internal'(S,'cycle',V)->
    S#state{'cycle'=V};
 %% K8sMaster.abs:90
'set_val_internal'(S,'baseSystemCpuLoad',V)->
    S#state{'baseSystemCpuLoad'=V};
 %% K8sMaster.abs:90
'set_val_internal'(S,'monitor',V)->
    S#state{'monitor'=V};
 %% K8sMaster.abs:90
'set_val_internal'(S,'costGranularity',V)->
    S#state{'costGranularity'=V};
 %% K8sMaster.abs:91
'set_val_internal'(S,'pMonitors',V)->
    S#state{'pMonitors'=V};
 %% K8sMaster.abs:92
'set_val_internal'(S,'pods',V)->
    S#state{'pods'=V};
 %% K8sMaster.abs:93
'set_val_internal'(S,'name',V)->
    S#state{'name'=V};
 %% K8sMaster.abs:94
'set_val_internal'(S,'refreshed',V)->
    S#state{'refreshed'=V};
 %% K8sMaster.abs:95
'set_val_internal'(S,'memoryLock',V)->
    S#state{'memoryLock'=V};
 %% K8sMaster.abs:96
'set_val_internal'(S,'computing',V)->
    S#state{'computing'=V};
 %% K8sMaster.abs:97
'set_val_internal'(S,'sysLoadInterleaving',V)->
    S#state{'sysLoadInterleaving'=V};
 %% K8sMaster.abs:99
'set_val_internal'(S,'availableCpu',V)->
    S#state{'availableCpu'=V};
 %% K8sMaster.abs:100
'set_val_internal'(S,'availableMemory',V)->
    S#state{'availableMemory'=V};
 %% K8sMaster.abs:101
'set_val_internal'(S,'systemCpuLoad',V)->
    S#state{'systemCpuLoad'=V};
 %% K8sMaster.abs:103
'set_val_internal'(S,'requestedCpu',V)->
    S#state{'requestedCpu'=V};
 %% K8sMaster.abs:105
'set_val_internal'(S,'remainingSysLoadSteps',V)->
    S#state{'remainingSysLoadSteps'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'id', S#state.'id' }
        , { 'cpu', S#state.'cpu' }
        , { 'memory', S#state.'memory' }
        , { 'timeUnitSize', S#state.'timeUnitSize' }
        , { 'cycle', S#state.'cycle' }
        , { 'baseSystemCpuLoad', S#state.'baseSystemCpuLoad' }
        , { 'monitor', S#state.'monitor' }
        , { 'costGranularity', S#state.'costGranularity' }
        , { 'pMonitors', S#state.'pMonitors' }
        , { 'pods', S#state.'pods' }
        , { 'name', S#state.'name' }
        , { 'refreshed', S#state.'refreshed' }
        , { 'memoryLock', S#state.'memoryLock' }
        , { 'computing', S#state.'computing' }
        , { 'sysLoadInterleaving', S#state.'sysLoadInterleaving' }
        , { 'availableCpu', S#state.'availableCpu' }
        , { 'availableMemory', S#state.'availableMemory' }
        , { 'systemCpuLoad', S#state.'systemCpuLoad' }
        , { 'requestedCpu', S#state.'requestedCpu' }
        , { 'remainingSysLoadSteps', S#state.'remainingSysLoadSteps' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_id,P_cpu,P_memory,P_timeUnitSize,P_cycle,P_baseSystemCpuLoad,P_monitor,P_costGranularity,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'id',P_id)),
    put(this, C:set_val_internal(get(this),'cpu',P_cpu)),
    put(this, C:set_val_internal(get(this),'memory',P_memory)),
    put(this, C:set_val_internal(get(this),'timeUnitSize',P_timeUnitSize)),
    put(this, C:set_val_internal(get(this),'cycle',P_cycle)),
    put(this, C:set_val_internal(get(this),'baseSystemCpuLoad',P_baseSystemCpuLoad)),
    put(this, C:set_val_internal(get(this),'monitor',P_monitor)),
    put(this, C:set_val_internal(get(this),'costGranularity',P_costGranularity)),
     %% K8sMaster.abs:91--91
    put(this, C:set_val_internal(get(this),'pMonitors',m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack]))),
     %% K8sMaster.abs:92--92
    put(this, C:set_val_internal(get(this),'pods',m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack]))),
     %% K8sMaster.abs:93--93
    put(this, C:set_val_internal(get(this),'name',<<""/utf8>>)),
     %% K8sMaster.abs:94--94
    put(this, C:set_val_internal(get(this),'refreshed',false)),
     %% K8sMaster.abs:95--95
    put(this, C:set_val_internal(get(this),'memoryLock',false)),
     %% K8sMaster.abs:96--96
    put(this, C:set_val_internal(get(this),'computing',false)),
     %% K8sMaster.abs:97--97
    put(this, C:set_val_internal(get(this),'sysLoadInterleaving',false)),
     %% K8sMaster.abs:99--99
    put(this, C:set_val_internal(get(this),'availableCpu',0)),
     %% K8sMaster.abs:100--100
    put(this, C:set_val_internal(get(this),'availableMemory',0)),
     %% K8sMaster.abs:101--101
    put(this, C:set_val_internal(get(this),'systemCpuLoad',0)),
     %% K8sMaster.abs:103--103
    put(this, C:set_val_internal(get(this),'requestedCpu',0)),
     %% K8sMaster.abs:105--105
    put(this, C:set_val_internal(get(this),'remainingSysLoadSteps',0)),
     %% K8sMaster.abs:108--108
    put(this, C:set_val_internal(get(this), 'name',iolist_to_binary([<<"Node-"/utf8>>, builtin:toString(Cog,C:get_val_internal(get(this), 'id'))]))),
     %% K8sMaster.abs:109--109
    put(this, C:set_val_internal(get(this), 'availableCpu',C:get_val_internal(get(this), 'cpu'))),
     %% K8sMaster.abs:110--110
    put(this, C:set_val_internal(get(this), 'availableMemory',C:get_val_internal(get(this), 'memory'))),
     %% K8sMaster.abs:111--111
    put(this, C:set_val_internal(get(this), 'systemCpuLoad',C:get_val_internal(get(this), 'baseSystemCpuLoad'))),
     %% K8sMaster.abs:112--112
    put(this, C:set_val_internal(get(this), 'remainingSysLoadSteps',C:get_val_internal(get(this), 'costGranularity'))),
     %% K8sMaster.abs:113--113
    T_1 = cog:create_task(O,'m_resetResources',[[]],#task_info{method= <<"resetResources"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
    T_1,
     %% K8sMaster.abs:114--114
    T_2 = cog:create_task(O,'m_consumeSystemLoad',[[]],#task_info{method= <<"consumeSystemLoad"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
    T_2,
     %% K8sMaster.abs:115--115
    T_3 = cog:create_task(O,'m_consumeSystemCpu',[[]],#task_info{method= <<"consumeSystemCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
    T_3,
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sMaster.abs:118
 %% K8sMaster.abs:118
'm_getName'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:119--119
        C:get_val_internal(get(this), 'name')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getName and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:122
 %% K8sMaster.abs:122
'm_getPods'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:123--123
        C:get_val_internal(get(this), 'pods')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getPods and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:126
 %% K8sMaster.abs:126
'm_getMonitor'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:127--127
        C:get_val_internal(get(this), 'monitor')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getMonitor and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:130
 %% K8sMaster.abs:130
'm_getTimeFraction'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:131--131
        put(vars, (get(vars))#{'timeFraction' =>  rationals:rdiv(( rationals:sub(C:get_val_internal(get(this), 'cpu'),C:get_val_internal(get(this), 'availableCpu'))) ,C:get_val_internal(get(this), 'cpu')) }),
         %% K8sMaster.abs:132--132
        maps:get('timeFraction', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getTimeFraction and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:137
 %% K8sMaster.abs:137
'm_resetResources'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:139--139
        T_1 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_setConsumedCpu',[( rationals:sub(C:get_val_internal(get(this), 'cpu'),C:get_val_internal(get(this), 'availableCpu'))) ,[]],#task_info{method= <<"setConsumedCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
         %% K8sMaster.abs:140--140
        T_2 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_setConsumedMemory',[( rationals:sub(C:get_val_internal(get(this), 'memory'),C:get_val_internal(get(this), 'availableMemory'))) ,[]],#task_info{method= <<"setConsumedMemory"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_2,
         %% K8sMaster.abs:142--142
        put(this, C:set_val_internal(get(this), 'availableCpu',C:get_val_internal(get(this), 'cpu'))),
         %% K8sMaster.abs:143--143
        put(this, C:set_val_internal(get(this), 'systemCpuLoad',C:get_val_internal(get(this), 'baseSystemCpuLoad'))),
         %% K8sMaster.abs:144--144
        put(this, C:set_val_internal(get(this), 'remainingSysLoadSteps',C:get_val_internal(get(this), 'costGranularity'))),
         %% K8sMaster.abs:146--146
        cog:suspend_current_task_for_duration(Cog,C:get_val_internal(get(this), 'cycle'),C:get_val_internal(get(this), 'cycle'),[O,DC| Stack]),
        ok,
         %% K8sMaster.abs:148--148
        T_3 = cog:create_task(O,'m_resetResources',[[]],#task_info{method= <<"resetResources"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_3,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method resetResources and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:152
 %% K8sMaster.abs:152
'm_consumeSystemLoad'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:153--153
        cog:suspend_current_task_for_duration(Cog, rationals:rdiv(C:get_val_internal(get(this), 'cycle'),2) , rationals:rdiv(C:get_val_internal(get(this), 'cycle'),2) ,[O,DC| Stack]),
        ok,
         %% K8sMaster.abs:155--155
        put(this, C:set_val_internal(get(this), 'availableCpu',( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),C:get_val_internal(get(this), 'systemCpuLoad'))) )),
         %% K8sMaster.abs:157--157
        put(this, C:set_val_internal(get(this), 'systemCpuLoad',0)),
         %% K8sMaster.abs:159--159
        cog:suspend_current_task_for_duration(Cog, rationals:rdiv(C:get_val_internal(get(this), 'cycle'),2) , rationals:rdiv(C:get_val_internal(get(this), 'cycle'),2) ,[O,DC| Stack]),
        ok,
         %% K8sMaster.abs:161--161
        T_1 = cog:create_task(O,'m_consumeSystemLoad',[[]],#task_info{method= <<"consumeSystemLoad"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method consumeSystemLoad and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:165
 %% K8sMaster.abs:165
'm_consumeSystemCpu'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sMaster.abs:166--166
        cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
        (fun Poll ([])->
            receive {check, OState} -> 
                put(this, OState),
                    try
                        case C:get_val_internal(get(this), 'sysLoadInterleaving') of
                            true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                            false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                        end
                    catch
                        _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                    end;
                wait -> Poll([]);
                {token, OState} -> put(this, OState), ok;
                {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                    Poll([]);
                {get_references, Sender} ->
                    cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                    Poll([])
                end end)
            ([]),
             %% K8sMaster.abs:167--167
            cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
            (fun Poll ([])->
                receive {check, OState} -> 
                    put(this, OState),
                        try
                            case cmp:gt(C:get_val_internal(get(this), 'remainingSysLoadSteps'),0) of
                                true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                            end
                        catch
                            _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                        end;
                    wait -> Poll([]);
                    {token, OState} -> put(this, OState), ok;
                    {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                        Poll([]);
                    {get_references, Sender} ->
                        cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                        Poll([])
                    end end)
                ([]),
                 %% K8sMaster.abs:170--170
                put(vars, (get(vars))#{'toConsume' =>  rationals:rdiv(C:get_val_internal(get(this), 'systemCpuLoad'),C:get_val_internal(get(this), 'remainingSysLoadSteps')) }),
                 %% K8sMaster.abs:172--172
                put(this, C:set_val_internal(get(this), 'availableCpu',( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),maps:get('toConsume', get(vars)))) )),
                 %% K8sMaster.abs:173--173
                put(this, C:set_val_internal(get(this), 'systemCpuLoad',( rationals:sub(C:get_val_internal(get(this), 'systemCpuLoad'),maps:get('toConsume', get(vars)))) )),
                 %% K8sMaster.abs:175--175
                put(this, C:set_val_internal(get(this), 'remainingSysLoadSteps',(C:get_val_internal(get(this), 'remainingSysLoadSteps') - 1) )),
                 %% K8sMaster.abs:176--176
                put(this, C:set_val_internal(get(this), 'sysLoadInterleaving',false)),
                 %% K8sMaster.abs:180--180
                T_1 = cog:create_task(O,'m_consumeSystemCpu',[[]],#task_info{method= <<"consumeSystemCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                T_1,
                dataUnit
                
            catch
                _:Exception:Stacktrace ->
                    io:format(standard_error, "Uncaught ~s in method consumeSystemCpu and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                    io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                    object:die(O, Exception), exit(Exception)
            end.
         %% K8sMaster.abs:183
         %% K8sMaster.abs:183
        'm_consumeCpu'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,V_p_0,V_reqSysLoadPerUnit_0,Stack)->
            C=(get(this))#state.class,
            put(vars, #{ 'this' => O,
 'amount' => V_amount_0,
 'p' => V_p_0,
 'reqSysLoadPerUnit' => V_reqSysLoadPerUnit_0 }),
            try
                 %% K8sMaster.abs:184--184
                put(vars, (get(vars))#{'done' => false}),
                 %% K8sMaster.abs:185--185
                put(vars, (get(vars))#{'timeFraction' => 0}),
                 %% K8sMaster.abs:186--186
                put(vars, (get(vars))#{'generatedSysLoad' => ( rationals:mul(maps:get('amount', get(vars)),maps:get('reqSysLoadPerUnit', get(vars)))) }),
                 %% K8sMaster.abs:187--187
                put(vars, (get(vars))#{'servAvailCpu' => 0}),
                 %% K8sMaster.abs:189--189
                []=(fun Loop ([])->
                    case not (maps:get('done', get(vars))) of
                    false -> [];
                    true -> receive
                            {stop_world, CogRef} ->
                                cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                cog:task_is_runnable(Cog,self()),
                                task:wait_for_token(Cog,[O,DC| Stack])
                            after 0 -> ok
                        end,
                         %% K8sMaster.abs:190--190
                        cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                        (fun Poll ([])->
                            receive {check, OState} -> 
                                put(this, OState),
                                    try
                                        case cmp:gt(( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),C:get_val_internal(get(this), 'systemCpuLoad'))) ,0) of
                                            true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                            false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                        end
                                    catch
                                        _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                    end;
                                wait -> Poll([]);
                                {token, OState} -> put(this, OState), ok;
                                {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                    Poll([]);
                                {get_references, Sender} ->
                                    cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                    Poll([])
                                end end)
                            ([]),
                             %% K8sMaster.abs:191--191
                            put(vars, (get(vars))#{'servAvailCpu' := ( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),( rationals:add(C:get_val_internal(get(this), 'systemCpuLoad'),maps:get('generatedSysLoad', get(vars)))) )) }),
                             %% K8sMaster.abs:193--193
                            case cmp:ge(maps:get('servAvailCpu', get(vars)),maps:get('amount', get(vars))) of
                                true ->  %% K8sMaster.abs:194--194
                                put(this, C:set_val_internal(get(this), 'availableCpu',( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),maps:get('amount', get(vars)))) )),
                                 %% K8sMaster.abs:195--195
                                put(this, C:set_val_internal(get(this), 'systemCpuLoad',( rationals:add(C:get_val_internal(get(this), 'systemCpuLoad'),maps:get('generatedSysLoad', get(vars)))) )),
                                 %% K8sMaster.abs:198--198
                                put(vars, (get(vars))#{'timeFraction' := (fun() -> case O of
                                    null -> throw(dataNullPointerException);
                                    Callee=#object{oid=Oid,cog=Cog} ->
                                        %% self-call
                                        Vars=get(vars),
                                        Result=C:'m_getTimeFraction'(Callee,[O,DC,Vars| Stack]),
                                        put(vars, Vars),
                                        Result;
                                    Callee=#object{oid=ObjRef,cog=Cog} ->
                                        %% cog-local call
                                        State=get(this),
                                        Vars=get(vars),
                                        cog:object_state_changed(Cog, O, State),
                                        put(this,cog:get_object_state(Callee#object.cog, Callee)),
                                        put(task_info,(get(task_info))#task_info{this=Callee}),
                                        T=object:get_class_from_state(get(this)), % it's the callee state already
                                        Result=T:'m_getTimeFraction'(Callee,[O,DC,Vars,State| Stack]),
                                        cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                                        put(task_info,(get(task_info))#task_info{this=O}),
                                        put(this, cog:get_object_state(Cog, O)),
                                        put(vars, Vars),
                                        Result;
                                    Callee ->
                                        %% remote call
                                        TempFuture = cog:create_task(Callee,'m_getTimeFraction',[[]],#task_info{method= <<"getTimeFraction"/utf8>>},Cog, true),
                                        future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                                end end)()}),
                                 %% K8sMaster.abs:200--200
                                put(this, C:set_val_internal(get(this), 'sysLoadInterleaving',true)),
                                 %% K8sMaster.abs:201--201
                                put(vars, (get(vars))#{'done' := true});
                                false ->                              %% K8sMaster.abs:206--206
                            put(vars, (get(vars))#{'amount' := ( rationals:sub(maps:get('amount', get(vars)),maps:get('servAvailCpu', get(vars)))) }),
                             %% K8sMaster.abs:207--207
                            put(this, C:set_val_internal(get(this), 'availableCpu',( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),maps:get('servAvailCpu', get(vars)))) )),
                             %% K8sMaster.abs:209--209
                            put(this, C:set_val_internal(get(this), 'systemCpuLoad',( rationals:add(C:get_val_internal(get(this), 'systemCpuLoad'),maps:get('generatedSysLoad', get(vars)))) )),
                             %% K8sMaster.abs:210--210
                            put(vars, (get(vars))#{'generatedSysLoad' := 0}),
                             %% K8sMaster.abs:213--213
                            T_1 = cog:create_task(maps:get('p', get(vars)),'m_setBlocked',[[]],#task_info{method= <<"setBlocked"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                            T_1,
                             %% K8sMaster.abs:215--215
                            cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                            (fun Poll ([])->
                                receive {check, OState} -> 
                                    put(this, OState),
                                        try
                                            case cmp:gt(( rationals:sub(C:get_val_internal(get(this), 'availableCpu'),C:get_val_internal(get(this), 'systemCpuLoad'))) ,0) of
                                                true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                                false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                            end
                                        catch
                                            _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                        end;
                                    wait -> Poll([]);
                                    {token, OState} -> put(this, OState), ok;
                                    {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                        Poll([]);
                                    {get_references, Sender} ->
                                        cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                        Poll([])
                                    end end)
                                ([])
                            end,
                        Loop([])  end end)
                    ([]),
                     %% K8sMaster.abs:219--219
                    maps:get('timeFraction', get(vars))
                catch
                    _:Exception:Stacktrace ->
                        io:format(standard_error, "Uncaught ~s in method consumeCpu and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                        object:die(O, Exception), exit(Exception)
                end.
             %% K8sMaster.abs:222
             %% K8sMaster.abs:222
            'm_allocateMemory'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,Stack)->
                C=(get(this))#state.class,
                put(vars, #{ 'this' => O,
 'amount' => V_amount_0 }),
                try
                     %% K8sMaster.abs:223--223
                    put(vars, (get(vars))#{'givenMemory' => 0}),
                     %% K8sMaster.abs:224--224
                    cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                    (fun Poll ([])->
                        receive {check, OState} -> 
                            put(this, OState),
                                try
                                    case not (C:get_val_internal(get(this), 'memoryLock')) of
                                        true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                        false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                    end
                                catch
                                    _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                end;
                            wait -> Poll([]);
                            {token, OState} -> put(this, OState), ok;
                            {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                Poll([]);
                            {get_references, Sender} ->
                                cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                Poll([])
                            end end)
                        ([]),
                         %% K8sMaster.abs:225--225
                        put(this, C:set_val_internal(get(this), 'memoryLock',true)),
                         %% K8sMaster.abs:227--227
                        case cmp:ge(C:get_val_internal(get(this), 'availableMemory'),maps:get('amount', get(vars))) of
                            true ->  %% K8sMaster.abs:228--228
                            put(this, C:set_val_internal(get(this), 'availableMemory',( rationals:sub(C:get_val_internal(get(this), 'availableMemory'),maps:get('amount', get(vars)))) )),
                             %% K8sMaster.abs:229--229
                            put(vars, (get(vars))#{'givenMemory' := maps:get('amount', get(vars))});
                            false ->                         ok
                        end,
                         %% K8sMaster.abs:232--232
                        put(this, C:set_val_internal(get(this), 'memoryLock',false)),
                         %% K8sMaster.abs:234--234
                        maps:get('givenMemory', get(vars))
                    catch
                        _:Exception:Stacktrace ->
                            io:format(standard_error, "Uncaught ~s in method allocateMemory and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                            object:die(O, Exception), exit(Exception)
                    end.
                 %% K8sMaster.abs:238
                 %% K8sMaster.abs:238
                'm_releaseMemory'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,Stack)->
                    C=(get(this))#state.class,
                    put(vars, #{ 'this' => O,
 'amount' => V_amount_0 }),
                    try
                         %% K8sMaster.abs:239--239
                        put(vars, (get(vars))#{'releasedMemory' => 0}),
                         %% K8sMaster.abs:240--240
                        cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                        (fun Poll ([])->
                            receive {check, OState} -> 
                                put(this, OState),
                                    try
                                        case not (C:get_val_internal(get(this), 'memoryLock')) of
                                            true -> cog:task_poll_is_ready(Cog, self(), get(task_info)), Poll([]);
                                            false -> cog:task_poll_is_not_ready(Cog, self(), get(task_info)),  Poll([])
                                        end
                                    catch
                                        _:Exception -> cog:task_poll_has_crashed(Cog, self(), get(task_info)), throw(Exception)
                                    end;
                                wait -> Poll([]);
                                {token, OState} -> put(this, OState), ok;
                                {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                                    Poll([]);
                                {get_references, Sender} ->
                                    cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                                    Poll([])
                                end end)
                            ([]),
                             %% K8sMaster.abs:242--242
                            put(this, C:set_val_internal(get(this), 'memoryLock',true)),
                             %% K8sMaster.abs:243--243
                            put(this, C:set_val_internal(get(this), 'availableMemory',( rationals:add(C:get_val_internal(get(this), 'availableMemory'),maps:get('amount', get(vars)))) )),
                             %% K8sMaster.abs:244--244
                            put(this, C:set_val_internal(get(this), 'memoryLock',false)),
                             %% K8sMaster.abs:246--246
                            put(vars, (get(vars))#{'releasedMemory' := maps:get('amount', get(vars))}),
                             %% K8sMaster.abs:248--248
                            maps:get('releasedMemory', get(vars))
                        catch
                            _:Exception:Stacktrace ->
                                io:format(standard_error, "Uncaught ~s in method releaseMemory and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                                io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                                object:die(O, Exception), exit(Exception)
                        end.
                     %% K8sMaster.abs:251
                     %% K8sMaster.abs:251
                    'm_addPod'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_p_0,V_rm_0,Stack)->
                        C=(get(this))#state.class,
                        put(vars, #{ 'this' => O,
 'p' => V_p_0,
 'rm' => V_rm_0 }),
                        try
                             %% K8sMaster.abs:252--252
                            put(vars, (get(vars))#{'tmp103996481' => cog:create_task(maps:get('rm', get(vars)),'m_getCpuRequest',[[]],#task_info{method= <<"getCpuRequest"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                             %% K8sMaster.abs:252--252
                            future:await(maps:get('tmp103996481', get(vars)), Cog, [O,DC| Stack]),
                            ok,
                             %% K8sMaster.abs:252--252
                            put(vars, (get(vars))#{'reqCpu' => future:get_blocking(maps:get('tmp103996481', get(vars)), Cog, [O,DC| Stack])}),
                             %% K8sMaster.abs:253--253
                            put(this, C:set_val_internal(get(this), 'pMonitors',m_ABS_StdLib_funs:f_appendright(Cog,C:get_val_internal(get(this), 'pMonitors'),maps:get('rm', get(vars)),[O,DC| Stack]))),
                             %% K8sMaster.abs:254--254
                            put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_appendright(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p', get(vars)),[O,DC| Stack]))),
                             %% K8sMaster.abs:256--256
                            put(this, C:set_val_internal(get(this), 'requestedCpu',( rationals:add(C:get_val_internal(get(this), 'requestedCpu'),maps:get('reqCpu', get(vars)))) )),
                             %% K8sMaster.abs:257--257
                            T_1 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_setRequestedCpu',[C:get_val_internal(get(this), 'requestedCpu'),[]],#task_info{method= <<"setRequestedCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                            T_1,
                            dataUnit
                            
                        catch
                            _:Exception:Stacktrace ->
                                io:format(standard_error, "Uncaught ~s in method addPod and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                                io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                                object:die(O, Exception), exit(Exception)
                        end.
                     %% K8sMaster.abs:260
                     %% K8sMaster.abs:260
                    'm_removePod'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_p_0,V_rm_0,Stack)->
                        C=(get(this))#state.class,
                        put(vars, #{ 'this' => O,
 'p' => V_p_0,
 'rm' => V_rm_0 }),
                        try
                             %% K8sMaster.abs:261--261
                            put(vars, (get(vars))#{'tmp905376005' => cog:create_task(maps:get('rm', get(vars)),'m_getCpuRequest',[[]],#task_info{method= <<"getCpuRequest"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                             %% K8sMaster.abs:261--261
                            future:await(maps:get('tmp905376005', get(vars)), Cog, [O,DC| Stack]),
                            ok,
                             %% K8sMaster.abs:261--261
                            put(vars, (get(vars))#{'reqCpu' => future:get_blocking(maps:get('tmp905376005', get(vars)), Cog, [O,DC| Stack])}),
                             %% K8sMaster.abs:262--262
                            put(this, C:set_val_internal(get(this), 'pMonitors',m_ABS_StdLib_funs:f_without(Cog,C:get_val_internal(get(this), 'pMonitors'),maps:get('rm', get(vars)),[O,DC| Stack]))),
                             %% K8sMaster.abs:263--263
                            put(this, C:set_val_internal(get(this), 'pods',m_ABS_StdLib_funs:f_without(Cog,C:get_val_internal(get(this), 'pods'),maps:get('p', get(vars)),[O,DC| Stack]))),
                             %% K8sMaster.abs:265--265
                            put(this, C:set_val_internal(get(this), 'requestedCpu',( rationals:sub(C:get_val_internal(get(this), 'requestedCpu'),maps:get('reqCpu', get(vars)))) )),
                             %% K8sMaster.abs:266--266
                            T_1 = cog:create_task(C:get_val_internal(get(this), 'monitor'),'m_setRequestedCpu',[C:get_val_internal(get(this), 'requestedCpu'),[]],#task_info{method= <<"setRequestedCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
                            T_1,
                            dataUnit
                            
                        catch
                            _:Exception:Stacktrace ->
                                io:format(standard_error, "Uncaught ~s in method removePod and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                                io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                                object:die(O, Exception), exit(Exception)
                        end.
                     %% K8sMaster.abs:269
                     %% K8sMaster.abs:269
                    'm_getPMonitors'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                        C=(get(this))#state.class,
                        put(vars, #{ 'this' => O }),
                        try
                             %% K8sMaster.abs:270--270
                            C:get_val_internal(get(this), 'pMonitors')
                        catch
                            _:Exception:Stacktrace ->
                                io:format(standard_error, "Uncaught ~s in method getPMonitors and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                                io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                                object:die(O, Exception), exit(Exception)
                        end.
                     %% K8sMaster.abs:273
                     %% K8sMaster.abs:273
                    'm_getRequestedCpu'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                        C=(get(this))#state.class,
                        put(vars, #{ 'this' => O }),
                        try
                             %% K8sMaster.abs:274--274
                            C:get_val_internal(get(this), 'requestedCpu')
                        catch
                            _:Exception:Stacktrace ->
                                io:format(standard_error, "Uncaught ~s in method getRequestedCpu and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                                io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                                object:die(O, Exception), exit(Exception)
                        end.
                     %% K8sMaster.abs:277
                     %% K8sMaster.abs:277
                    'm_getAvailableCpu'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                        C=(get(this))#state.class,
                        put(vars, #{ 'this' => O }),
                        try
                             %% K8sMaster.abs:278--278
                            ( rationals:sub(C:get_val_internal(get(this), 'cpu'),C:get_val_internal(get(this), 'requestedCpu'))) 
                        catch
                            _:Exception:Stacktrace ->
                                io:format(standard_error, "Uncaught ~s in method getAvailableCpu and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                                io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                                object:die(O, Exception), exit(Exception)
                        end.
                     %% K8sMaster.abs:281
                     %% K8sMaster.abs:281
                    'm_getCpuTimeMap'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
                        C=(get(this))#state.class,
                        put(vars, #{ 'this' => O }),
                        try
                             %% K8sMaster.abs:282--282
                            iolist_to_binary([iolist_to_binary([builtin:toString(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack])), <<","/utf8>>]), builtin:toString(Cog,( rationals:sub(C:get_val_internal(get(this), 'cpu'),C:get_val_internal(get(this), 'requestedCpu'))) )])
                        catch
                            _:Exception:Stacktrace ->
                                io:format(standard_error, "Uncaught ~s in method getCpuTimeMap and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                                io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                                object:die(O, Exception), exit(Exception)
                        end.
