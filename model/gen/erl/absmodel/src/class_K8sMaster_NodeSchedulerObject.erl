-module(class_K8sMaster_NodeSchedulerObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"NodeScheduler">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sMaster_NodeSchedulerObject,'cloud'=null,'loadPeriod'=null,'resourceCycle'=null,'nodesMap'=null,'rulesMap'=null,'nodes'=null,'activeNodes'=null,'nextID'=null,'deploying'=null}).
'init_internal'()->
    #state{}.

 %% K8sMaster.abs:303
'get_val_internal'(#state{'cloud'=G},'cloud')->
    G;
 %% K8sMaster.abs:303
'get_val_internal'(#state{'loadPeriod'=G},'loadPeriod')->
    G;
 %% K8sMaster.abs:303
'get_val_internal'(#state{'resourceCycle'=G},'resourceCycle')->
    G;
 %% K8sMaster.abs:305
'get_val_internal'(#state{'nodesMap'=G},'nodesMap')->
    G;
 %% K8sMaster.abs:306
'get_val_internal'(#state{'rulesMap'=G},'rulesMap')->
    G;
 %% K8sMaster.abs:308
'get_val_internal'(#state{'nodes'=G},'nodes')->
    G;
 %% K8sMaster.abs:310
'get_val_internal'(#state{'activeNodes'=G},'activeNodes')->
    G;
 %% K8sMaster.abs:311
'get_val_internal'(#state{'nextID'=G},'nextID')->
    G;
 %% K8sMaster.abs:314
'get_val_internal'(#state{'deploying'=G},'deploying')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sMaster.abs:303
'set_val_internal'(S,'cloud',V)->
    S#state{'cloud'=V};
 %% K8sMaster.abs:303
'set_val_internal'(S,'loadPeriod',V)->
    S#state{'loadPeriod'=V};
 %% K8sMaster.abs:303
'set_val_internal'(S,'resourceCycle',V)->
    S#state{'resourceCycle'=V};
 %% K8sMaster.abs:305
'set_val_internal'(S,'nodesMap',V)->
    S#state{'nodesMap'=V};
 %% K8sMaster.abs:306
'set_val_internal'(S,'rulesMap',V)->
    S#state{'rulesMap'=V};
 %% K8sMaster.abs:308
'set_val_internal'(S,'nodes',V)->
    S#state{'nodes'=V};
 %% K8sMaster.abs:310
'set_val_internal'(S,'activeNodes',V)->
    S#state{'activeNodes'=V};
 %% K8sMaster.abs:311
'set_val_internal'(S,'nextID',V)->
    S#state{'nextID'=V};
 %% K8sMaster.abs:314
'set_val_internal'(S,'deploying',V)->
    S#state{'deploying'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'cloud', S#state.'cloud' }
        , { 'loadPeriod', S#state.'loadPeriod' }
        , { 'resourceCycle', S#state.'resourceCycle' }
        , { 'nodesMap', S#state.'nodesMap' }
        , { 'rulesMap', S#state.'rulesMap' }
        , { 'nodes', S#state.'nodes' }
        , { 'activeNodes', S#state.'activeNodes' }
        , { 'nextID', S#state.'nextID' }
        , { 'deploying', S#state.'deploying' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_cloud,P_loadPeriod,P_resourceCycle,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'cloud',P_cloud)),
    put(this, C:set_val_internal(get(this),'loadPeriod',P_loadPeriod)),
    put(this, C:set_val_internal(get(this),'resourceCycle',P_resourceCycle)),
     %% K8sMaster.abs:305--305
    put(this, C:set_val_internal(get(this),'nodesMap',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
     %% K8sMaster.abs:306--306
    put(this, C:set_val_internal(get(this),'rulesMap',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
     %% K8sMaster.abs:308--308
    put(this, C:set_val_internal(get(this),'nodes',m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack]))),
     %% K8sMaster.abs:310--310
    put(this, C:set_val_internal(get(this),'activeNodes',m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack]))),
     %% K8sMaster.abs:311--311
    put(this, C:set_val_internal(get(this),'nextID',1)),
     %% K8sMaster.abs:314--314
    put(this, C:set_val_internal(get(this),'deploying',false)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sMaster.abs:316
 %% K8sMaster.abs:316
'm_createNodes'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_nNodes_0,V_cpu_0,V_memory_0,V_timeUnitSize_0,V_baseSysConsumption_0,V_costGranularity_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'nNodes' => V_nNodes_0,
 'cpu' => V_cpu_0,
 'memory' => V_memory_0,
 'timeUnitSize' => V_timeUnitSize_0,
 'baseSysConsumption' => V_baseSysConsumption_0,
 'costGranularity' => V_costGranularity_0 }),
    try
         %% K8sMaster.abs:317--317
        put(vars, (get(vars))#{'ctr' => 0}),
         %% K8sMaster.abs:318--318
        []=(fun Loop ([])->
            case cmp:lt(maps:get('ctr', get(vars)),maps:get('nNodes', get(vars))) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sMaster.abs:319--319
                put(vars, (get(vars))#{'monitor' => object:new(cog:start(Cog,DC),class_K8sUtil_NodeResourcesMonitorObject,[C:get_val_internal(get(this), 'resourceCycle'),maps:get('cpu', get(vars)),maps:get('memory', get(vars)),[]],Cog,[O,DC| Stack])}),
                cog_monitor:register_object_with_http_name(maps:get('monitor', get(vars)),iolist_to_binary([<<"M"/utf8>>, builtin:toString(Cog,(maps:get('ctr', get(vars)) + 1) )])),
                 %% K8sMaster.abs:320--320
                put(vars, (get(vars))#{'node' => object:new(cog:start(Cog,DC, { fun m_K8sUtil_funs:f_node_reset_resources_scheduler/3, [ queue ] }),class_K8sMaster_NodeObject,[C:get_val_internal(get(this), 'nextID'),maps:get('cpu', get(vars)),maps:get('memory', get(vars)),maps:get('timeUnitSize', get(vars)),C:get_val_internal(get(this), 'resourceCycle'),maps:get('baseSysConsumption', get(vars)),maps:get('monitor', get(vars)),maps:get('costGranularity', get(vars)),[]],Cog,[O,DC| Stack])}),
                cog_monitor:register_object_with_http_name(maps:get('node', get(vars)),iolist_to_binary([<<"N"/utf8>>, builtin:toString(Cog,(maps:get('ctr', get(vars)) + 1) )])),
                 %% K8sMaster.abs:321--321
                put(vars, (get(vars))#{'tmp61480005' => cog:create_task(maps:get('monitor', get(vars)),'m_setNode',[maps:get('node', get(vars)),[]],#task_info{method= <<"setNode"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sMaster.abs:321--321
                future:await(maps:get('tmp61480005', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sMaster.abs:322--322
                put(this, C:set_val_internal(get(this), 'nodes',m_ABS_StdLib_funs:f_appendright(Cog,C:get_val_internal(get(this), 'nodes'),maps:get('node', get(vars)),[O,DC| Stack]))),
                 %% K8sMaster.abs:323--323
                put(this, C:set_val_internal(get(this), 'activeNodes',m_ABS_StdLib_funs:f_appendright(Cog,C:get_val_internal(get(this), 'activeNodes'),maps:get('node', get(vars)),[O,DC| Stack]))),
                 %% K8sMaster.abs:324--324
                put(this, C:set_val_internal(get(this), 'nodesMap',m_ABS_StdLib_funs:f_insert(Cog,C:get_val_internal(get(this), 'nodesMap'),{ dataPair,C:get_val_internal(get(this), 'nextID'),maps:get('node', get(vars))},[O,DC| Stack]))),
                 %% K8sMaster.abs:325--325
                put(this, C:set_val_internal(get(this), 'nextID',(C:get_val_internal(get(this), 'nextID') + 1) )),
                 %% K8sMaster.abs:326--326
                put(vars, (get(vars))#{'ctr' := (maps:get('ctr', get(vars)) + 1) }),
            Loop([])  end end)
        ([]),
         %% K8sMaster.abs:328--328
        T_1 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"[Time: "/utf8>>, builtin:toString(Cog,m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack]))]), <<"] *********** CREATED "/utf8>>]), builtin:toString(Cog,maps:get('nNodes', get(vars)))]), <<" NODES [CPU: "/utf8>>]), builtin:toString(Cog,maps:get('cpu', get(vars)))]), <<" - "/utf8>>]), <<"MEMORY: "/utf8>>]), builtin:toString(Cog,maps:get('memory', get(vars)))]), <<" ]"/utf8>>])),
        T_1,
         %% K8sMaster.abs:329--329
        true
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method createNodes and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sMaster.abs:333
 %% K8sMaster.abs:333
'm_deployPod'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_p_0,V_rm_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'p' => V_p_0,
 'rm' => V_rm_0 }),
    try
         %% K8sMaster.abs:334--334
        put(vars, (get(vars))#{'deployed' => false}),
         %% K8sMaster.abs:335--335
        put(vars, (get(vars))#{'tmp114580948' => cog:create_task(maps:get('rm', get(vars)),'m_getCpuRequest',[[]],#task_info{method= <<"getCpuRequest"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sMaster.abs:335--335
        future:await(maps:get('tmp114580948', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sMaster.abs:335--335
        put(vars, (get(vars))#{'requestedCpu' => future:get_blocking(maps:get('tmp114580948', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sMaster.abs:336--336
        put(vars, (get(vars))#{'tmp370428315' => cog:create_task(maps:get('rm', get(vars)),'m_getServiceName',[[]],#task_info{method= <<"getServiceName"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sMaster.abs:336--336
        future:await(maps:get('tmp370428315', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sMaster.abs:336--336
        put(vars, (get(vars))#{'serviceName' => future:get_blocking(maps:get('tmp370428315', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sMaster.abs:337--337
        put(vars, (get(vars))#{'result' => null}),
         %% K8sMaster.abs:338--338
        put(vars, (get(vars))#{'nodesToCheck' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% K8sMaster.abs:340--340
        put(vars, (get(vars))#{'nodeIds' => m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'rulesMap'),maps:get('serviceName', get(vars)),m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack]),[O,DC| Stack])}),
         %% K8sMaster.abs:342--342
        case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('nodeIds', get(vars)),[O,DC| Stack])) of
            true ->  %% K8sMaster.abs:343--343
            put(vars, (get(vars))#{'selected' => m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'nodesMap'),m_ABS_StdLib_funs:f_head(Cog,maps:get('nodeIds', get(vars)),[O,DC| Stack]),null,[O,DC| Stack])}),
             %% K8sMaster.abs:344--344
            case (not cmp:eq(maps:get('selected', get(vars)),null)) of
                true ->  %% K8sMaster.abs:345--345
                put(vars, (get(vars))#{'nodesToCheck' := m_ABS_StdLib_funs:f_list(Cog,[ maps:get('selected', get(vars))] ,[O,DC| Stack])}),
                 %% K8sMaster.abs:346--346
                put(this, C:set_val_internal(get(this), 'rulesMap',m_ABS_StdLib_funs:f_put(Cog,C:get_val_internal(get(this), 'rulesMap'),maps:get('serviceName', get(vars)),m_K8sUtil_funs:f_cycleIntList(Cog,maps:get('nodeIds', get(vars)),[O,DC| Stack]),[O,DC| Stack])));
                false ->             ok
            end;
            false ->         ok
        end,
         %% K8sMaster.abs:350--350
        case m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('nodesToCheck', get(vars)),[O,DC| Stack]) of
            true ->  %% K8sMaster.abs:351--351
            cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
            (fun Poll ([])->
                receive {check, OState} -> 
                    put(this, OState),
                        try
                            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,C:get_val_internal(get(this), 'activeNodes'),[O,DC| Stack])) of
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
                 %% K8sMaster.abs:352--352
                put(vars, (get(vars))#{'nodesToCheck' := C:get_val_internal(get(this), 'activeNodes')});
                false ->         ok
            end,
             %% K8sMaster.abs:355--355
            []=(fun Loop ([])->
                case not (maps:get('deployed', get(vars))) of
                false -> [];
                true -> receive
                        {stop_world, CogRef} ->
                            cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                            cog:task_is_runnable(Cog,self()),
                            task:wait_for_token(Cog,[O,DC| Stack])
                        after 0 -> ok
                    end,
                     %% K8sMaster.abs:356--356
                    cog:return_token(Cog,self(),waiting_poll,get(task_info),get(this)),
                    (fun Poll ([])->
                        receive {check, OState} -> 
                            put(this, OState),
                                try
                                    case not (C:get_val_internal(get(this), 'deploying')) of
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
                         %% K8sMaster.abs:357--357
                        put(this, C:set_val_internal(get(this), 'deploying',true)),
                         %% K8sMaster.abs:358--358
                        put(vars, (get(vars))#{'maxCpu' => -1}),
                         %% K8sMaster.abs:360--366
                        put(vars, (get(vars))#{'tmp461376017' => maps:get('nodesToCheck', get(vars))}),
                         %% K8sMaster.abs:360--366
                        []=(fun Loop ([])->
                            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp461376017', get(vars)),[O,DC| Stack])) of
                            false -> [];
                            true -> receive
                                    {stop_world, CogRef} ->
                                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                        cog:task_is_runnable(Cog,self()),
                                        task:wait_for_token(Cog,[O,DC| Stack])
                                    after 0 -> ok
                                end,
                                 %% K8sMaster.abs:360--366
                                put(vars, (get(vars))#{'n' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp461376017', get(vars)),[O,DC| Stack])}),
                                 %% K8sMaster.abs:360--366
                                put(vars, (get(vars))#{'tmp461376017' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp461376017', get(vars)),[O,DC| Stack])}),
                                 %% K8sMaster.abs:361--361
                                put(vars, (get(vars))#{'tmp342424709' => cog:create_task(maps:get('n', get(vars)),'m_getAvailableCpu',[[]],#task_info{method= <<"getAvailableCpu"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                                 %% K8sMaster.abs:361--361
                                future:await(maps:get('tmp342424709', get(vars)), Cog, [O,DC| Stack]),
                                ok,
                                 %% K8sMaster.abs:361--361
                                put(vars, (get(vars))#{'cpu' => future:get_blocking(maps:get('tmp342424709', get(vars)), Cog, [O,DC| Stack])}),
                                 %% K8sMaster.abs:362--362
                                case cmp:gt(maps:get('cpu', get(vars)),maps:get('maxCpu', get(vars))) of
                                    true ->  %% K8sMaster.abs:363--363
                                    put(vars, (get(vars))#{'maxCpu' := maps:get('cpu', get(vars))}),
                                     %% K8sMaster.abs:364--364
                                    put(vars, (get(vars))#{'result' := maps:get('n', get(vars))});
                                    false ->                                 ok
                                end,
                            Loop([])  end end)
                        ([]),
                         %% K8sMaster.abs:368--368
                        case cmp:ge(maps:get('maxCpu', get(vars)),maps:get('requestedCpu', get(vars))) of
                            true ->  %% K8sMaster.abs:369--369
                            put(vars, (get(vars))#{'tmp1207145081' => cog:create_task(maps:get('result', get(vars)),'m_addPod',[maps:get('p', get(vars)),maps:get('rm', get(vars)),[]],#task_info{method= <<"addPod"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                             %% K8sMaster.abs:369--369
                            future:await(maps:get('tmp1207145081', get(vars)), Cog, [O,DC| Stack]),
                            ok,
                             %% K8sMaster.abs:370--370
                            put(this, C:set_val_internal(get(this), 'deploying',false)),
                             %% K8sMaster.abs:371--371
                            put(vars, (get(vars))#{'deployed' := true});
                            false ->                          %% K8sMaster.abs:373--373
                        put(this, C:set_val_internal(get(this), 'deploying',false)),
                         %% K8sMaster.abs:374--374
                        cog:suspend_current_task_for_duration(Cog,1,1,[O,DC| Stack]),
                        ok
                        end,
                    Loop([])  end end)
                ([]),
                 %% K8sMaster.abs:377--377
                maps:get('result', get(vars))
            catch
                _:Exception:Stacktrace ->
                    io:format(standard_error, "Uncaught ~s in method deployPod and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                    io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                    object:die(O, Exception), exit(Exception)
            end.
         %% K8sMaster.abs:380
         %% K8sMaster.abs:380
        'm_getNodeStates'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
            C=(get(this))#state.class,
            put(vars, #{ 'this' => O }),
            try
                 %% K8sMaster.abs:381--381
                put(vars, (get(vars))#{'list' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
                 %% K8sMaster.abs:383--387
                put(vars, (get(vars))#{'tmp4172373' => C:get_val_internal(get(this), 'nodes')}),
                 %% K8sMaster.abs:383--387
                []=(fun Loop ([])->
                    case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp4172373', get(vars)),[O,DC| Stack])) of
                    false -> [];
                    true -> receive
                            {stop_world, CogRef} ->
                                cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                cog:task_is_runnable(Cog,self()),
                                task:wait_for_token(Cog,[O,DC| Stack])
                            after 0 -> ok
                        end,
                         %% K8sMaster.abs:383--387
                        put(vars, (get(vars))#{'node' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp4172373', get(vars)),[O,DC| Stack])}),
                         %% K8sMaster.abs:383--387
                        put(vars, (get(vars))#{'tmp4172373' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp4172373', get(vars)),[O,DC| Stack])}),
                         %% K8sMaster.abs:384--384
                        put(vars, (get(vars))#{'tmp1676500398' => cog:create_task(maps:get('node', get(vars)),'m_getMonitor',[[]],#task_info{method= <<"getMonitor"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                         %% K8sMaster.abs:384--384
                        future:await(maps:get('tmp1676500398', get(vars)), Cog, [O,DC| Stack]),
                        ok,
                         %% K8sMaster.abs:384--384
                        put(vars, (get(vars))#{'monitor' => future:get_blocking(maps:get('tmp1676500398', get(vars)), Cog, [O,DC| Stack])}),
                         %% K8sMaster.abs:385--385
                        put(vars, (get(vars))#{'tmp1468111065' => cog:create_task(maps:get('monitor', get(vars)),'m_getNodeState',[[]],#task_info{method= <<"getNodeState"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                         %% K8sMaster.abs:385--385
                        future:await(maps:get('tmp1468111065', get(vars)), Cog, [O,DC| Stack]),
                        ok,
                         %% K8sMaster.abs:385--385
                        put(vars, (get(vars))#{'ns' => future:get_blocking(maps:get('tmp1468111065', get(vars)), Cog, [O,DC| Stack])}),
                         %% K8sMaster.abs:386--386
                        put(vars, (get(vars))#{'list' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('list', get(vars)),maps:get('ns', get(vars)),[O,DC| Stack])}),
                    Loop([])  end end)
                ([]),
                 %% K8sMaster.abs:389--389
                maps:get('list', get(vars))
            catch
                _:Exception:Stacktrace ->
                    io:format(standard_error, "Uncaught ~s in method getNodeStates and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                    io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                    object:die(O, Exception), exit(Exception)
            end.
         %% K8sMaster.abs:392
         %% K8sMaster.abs:392
        'm_getNodes'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
            C=(get(this))#state.class,
            put(vars, #{ 'this' => O }),
            try
                 %% K8sMaster.abs:393--393
                C:get_val_internal(get(this), 'nodes')
            catch
                _:Exception:Stacktrace ->
                    io:format(standard_error, "Uncaught ~s in method getNodes and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                    io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                    object:die(O, Exception), exit(Exception)
            end.
         %% K8sMaster.abs:396
         %% K8sMaster.abs:396
        'm_setRulesMap'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_rulesMap_0,Stack)->
            C=(get(this))#state.class,
            put(vars, #{ 'this' => O,
 'rulesMap' => V_rulesMap_0 }),
            try
                 %% K8sMaster.abs:397--397
                put(this, C:set_val_internal(get(this), 'rulesMap',maps:get('rulesMap', get(vars)))),
                dataUnit
                
            catch
                _:Exception:Stacktrace ->
                    io:format(standard_error, "Uncaught ~s in method setRulesMap and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
                    io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
                    object:die(O, Exception), exit(Exception)
            end.
