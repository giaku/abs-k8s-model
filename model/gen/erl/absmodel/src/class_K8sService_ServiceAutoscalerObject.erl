-module(class_K8sService_ServiceAutoscalerObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceAutoscaler">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_ServiceAutoscalerObject,'scheduler'=null,'lb'=null,'sConfig'=null,'pConfig'=null,'nextID'=null,'maxPods'=null,'minPods'=null,'nPods'=null,'cycle'=null,'upscaleThreshold'=null,'downscaleThreshold'=null,'downscalePeriod'=null,'underDsThresholdCounter'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:377
'get_val_internal'(#state{'scheduler'=G},'scheduler')->
    G;
 %% K8sService.abs:377
'get_val_internal'(#state{'lb'=G},'lb')->
    G;
 %% K8sService.abs:377
'get_val_internal'(#state{'sConfig'=G},'sConfig')->
    G;
 %% K8sService.abs:377
'get_val_internal'(#state{'pConfig'=G},'pConfig')->
    G;
 %% K8sService.abs:378
'get_val_internal'(#state{'nextID'=G},'nextID')->
    G;
 %% K8sService.abs:379
'get_val_internal'(#state{'maxPods'=G},'maxPods')->
    G;
 %% K8sService.abs:380
'get_val_internal'(#state{'minPods'=G},'minPods')->
    G;
 %% K8sService.abs:381
'get_val_internal'(#state{'nPods'=G},'nPods')->
    G;
 %% K8sService.abs:382
'get_val_internal'(#state{'cycle'=G},'cycle')->
    G;
 %% K8sService.abs:385
'get_val_internal'(#state{'upscaleThreshold'=G},'upscaleThreshold')->
    G;
 %% K8sService.abs:386
'get_val_internal'(#state{'downscaleThreshold'=G},'downscaleThreshold')->
    G;
 %% K8sService.abs:388
'get_val_internal'(#state{'downscalePeriod'=G},'downscalePeriod')->
    G;
 %% K8sService.abs:389
'get_val_internal'(#state{'underDsThresholdCounter'=G},'underDsThresholdCounter')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:377
'set_val_internal'(S,'scheduler',V)->
    S#state{'scheduler'=V};
 %% K8sService.abs:377
'set_val_internal'(S,'lb',V)->
    S#state{'lb'=V};
 %% K8sService.abs:377
'set_val_internal'(S,'sConfig',V)->
    S#state{'sConfig'=V};
 %% K8sService.abs:377
'set_val_internal'(S,'pConfig',V)->
    S#state{'pConfig'=V};
 %% K8sService.abs:378
'set_val_internal'(S,'nextID',V)->
    S#state{'nextID'=V};
 %% K8sService.abs:379
'set_val_internal'(S,'maxPods',V)->
    S#state{'maxPods'=V};
 %% K8sService.abs:380
'set_val_internal'(S,'minPods',V)->
    S#state{'minPods'=V};
 %% K8sService.abs:381
'set_val_internal'(S,'nPods',V)->
    S#state{'nPods'=V};
 %% K8sService.abs:382
'set_val_internal'(S,'cycle',V)->
    S#state{'cycle'=V};
 %% K8sService.abs:385
'set_val_internal'(S,'upscaleThreshold',V)->
    S#state{'upscaleThreshold'=V};
 %% K8sService.abs:386
'set_val_internal'(S,'downscaleThreshold',V)->
    S#state{'downscaleThreshold'=V};
 %% K8sService.abs:388
'set_val_internal'(S,'downscalePeriod',V)->
    S#state{'downscalePeriod'=V};
 %% K8sService.abs:389
'set_val_internal'(S,'underDsThresholdCounter',V)->
    S#state{'underDsThresholdCounter'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'scheduler', S#state.'scheduler' }
        , { 'lb', S#state.'lb' }
        , { 'sConfig', S#state.'sConfig' }
        , { 'pConfig', S#state.'pConfig' }
        , { 'nextID', S#state.'nextID' }
        , { 'maxPods', S#state.'maxPods' }
        , { 'minPods', S#state.'minPods' }
        , { 'nPods', S#state.'nPods' }
        , { 'cycle', S#state.'cycle' }
        , { 'upscaleThreshold', S#state.'upscaleThreshold' }
        , { 'downscaleThreshold', S#state.'downscaleThreshold' }
        , { 'downscalePeriod', S#state.'downscalePeriod' }
        , { 'underDsThresholdCounter', S#state.'underDsThresholdCounter' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_scheduler,P_lb,P_sConfig,P_pConfig,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'scheduler',P_scheduler)),
    put(this, C:set_val_internal(get(this),'lb',P_lb)),
    put(this, C:set_val_internal(get(this),'sConfig',P_sConfig)),
    put(this, C:set_val_internal(get(this),'pConfig',P_pConfig)),
     %% K8sService.abs:378--378
    put(this, C:set_val_internal(get(this),'nextID',0)),
     %% K8sService.abs:379--379
    put(this, C:set_val_internal(get(this),'maxPods',0)),
     %% K8sService.abs:380--380
    put(this, C:set_val_internal(get(this),'minPods',0)),
     %% K8sService.abs:381--381
    put(this, C:set_val_internal(get(this),'nPods',0)),
     %% K8sService.abs:382--382
    put(this, C:set_val_internal(get(this),'cycle',0)),
     %% K8sService.abs:385--385
    put(this, C:set_val_internal(get(this),'upscaleThreshold',0)),
     %% K8sService.abs:386--386
    put(this, C:set_val_internal(get(this),'downscaleThreshold',0)),
     %% K8sService.abs:388--388
    put(this, C:set_val_internal(get(this),'downscalePeriod',0)),
     %% K8sService.abs:389--389
    put(this, C:set_val_internal(get(this),'underDsThresholdCounter',0)),
     %% K8sService.abs:392--392
    put(this, C:set_val_internal(get(this), 'maxPods',m_K8sUtil_funs:f_maxPods(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack]))),
     %% K8sService.abs:393--393
    put(this, C:set_val_internal(get(this), 'minPods',m_K8sUtil_funs:f_minPods(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack]))),
     %% K8sService.abs:394--394
    put(this, C:set_val_internal(get(this), 'cycle',m_K8sUtil_funs:f_scalerCycle(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack]))),
     %% K8sService.abs:395--395
    put(this, C:set_val_internal(get(this), 'upscaleThreshold',m_K8sUtil_funs:f_upscaleThreshold(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack]))),
     %% K8sService.abs:396--396
    put(this, C:set_val_internal(get(this), 'downscaleThreshold',m_K8sUtil_funs:f_downscaleThreshold(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack]))),
     %% K8sService.abs:397--397
    put(this, C:set_val_internal(get(this), 'downscalePeriod',m_K8sUtil_funs:f_downscalePeriod(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack]))),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:400
 %% K8sService.abs:400
'm_initialize'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:401--401
        put(vars, (get(vars))#{'ctr' => 0}),
         %% K8sService.abs:402--402
        put(vars, (get(vars))#{'nStartingPods' => m_K8sUtil_funs:f_startingPods(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack])}),
         %% K8sService.abs:403--403
        []=(fun Loop ([])->
            case cmp:lt(maps:get('ctr', get(vars)),maps:get('nStartingPods', get(vars))) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:404--404
                T_1 = (fun() -> case O of
                    null -> throw(dataNullPointerException);
                    Callee=#object{oid=Oid,cog=Cog} ->
                        %% self-call
                        Vars=get(vars),
                        Result=C:'m_launchPod'(Callee,[O,DC,Vars| Stack]),
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
                        Result=T:'m_launchPod'(Callee,[O,DC,Vars,State| Stack]),
                        cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                        put(task_info,(get(task_info))#task_info{this=O}),
                        put(this, cog:get_object_state(Cog, O)),
                        put(vars, Vars),
                        Result;
                    Callee ->
                        %% remote call
                        TempFuture = cog:create_task(Callee,'m_launchPod',[[]],#task_info{method= <<"launchPod"/utf8>>},Cog, true),
                        future:get_blocking(TempFuture, Cog, [O,DC| Stack])
                end end)(),
                T_1,
                 %% K8sService.abs:405--405
                put(vars, (get(vars))#{'ctr' := (maps:get('ctr', get(vars)) + 1) }),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:407--407
        T_1 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"[Time: "/utf8>>, builtin:toString(Cog,m_ABS_StdLib_funs:f_timeValue(Cog,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack]))]), <<"] ***********INIT: CREATED "/utf8>>]), builtin:toString(Cog,maps:get('nStartingPods', get(vars)))]), <<" PODS"/utf8>>])),
        T_1,
         %% K8sService.abs:408--408
        T_2 = cog:create_task(O,'m_resize',[[]],#task_info{method= <<"resize"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_2,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method initialize and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:411
 %% K8sService.abs:411
'm_resize'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:413--413
        put(vars, (get(vars))#{'tmp1941163569' => cog:create_task(C:get_val_internal(get(this), 'lb'),'m_getConsumptions',[[]],#task_info{method= <<"getConsumptions"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:413--413
        future:await(maps:get('tmp1941163569', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:413--413
        put(vars, (get(vars))#{'ss' => future:get_blocking(maps:get('tmp1941163569', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:415--415
        put(vars, (get(vars))#{'serviceRatio' => m_K8sUtil_funs:f_cpuRatio(Cog,maps:get('ss', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:417--417
        case cmp:lt(maps:get('serviceRatio', get(vars)),C:get_val_internal(get(this), 'downscaleThreshold')) of
            true ->  %% K8sService.abs:418--418
            put(this, C:set_val_internal(get(this), 'underDsThresholdCounter',(C:get_val_internal(get(this), 'underDsThresholdCounter') + 1) ));
            false ->          %% K8sService.abs:420--420
        put(this, C:set_val_internal(get(this), 'underDsThresholdCounter',0))
        end,
         %% K8sService.abs:423--423
        cog:suspend_current_task_for_duration(Cog,C:get_val_internal(get(this), 'cycle'),C:get_val_internal(get(this), 'cycle'),[O,DC| Stack]),
        ok,
         %% K8sService.abs:425--425
        case (cmp:ge(maps:get('serviceRatio', get(vars)),C:get_val_internal(get(this), 'upscaleThreshold'))) and (cmp:lt(C:get_val_internal(get(this), 'nPods'),C:get_val_internal(get(this), 'maxPods'))) of
            true ->  %% K8sService.abs:426--426
            put(vars, (get(vars))#{'nOfNewPods' => builtin:truncate(Cog, rationals:rdiv(maps:get('serviceRatio', get(vars)),C:get_val_internal(get(this), 'upscaleThreshold')) )}),
             %% K8sService.abs:427--427
            case cmp:gt((C:get_val_internal(get(this), 'nPods') + maps:get('nOfNewPods', get(vars))) ,C:get_val_internal(get(this), 'maxPods')) of
                true ->  %% K8sService.abs:428--428
                put(vars, (get(vars))#{'nOfNewPods' := (C:get_val_internal(get(this), 'maxPods') - C:get_val_internal(get(this), 'nPods')) });
                false ->             ok
            end,
             %% K8sService.abs:430--430
            []=(fun Loop ([])->
                case cmp:gt(maps:get('nOfNewPods', get(vars)),0) of
                false -> [];
                true -> receive
                        {stop_world, CogRef} ->
                            cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                            cog:task_is_runnable(Cog,self()),
                            task:wait_for_token(Cog,[O,DC| Stack])
                        after 0 -> ok
                    end,
                     %% K8sService.abs:431--431
                    put(vars, (get(vars))#{'tmp1183266411' => cog:create_task(O,'m_launchPod',[[]],#task_info{method= <<"launchPod"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                     %% K8sService.abs:431--431
                    future:await(maps:get('tmp1183266411', get(vars)), Cog, [O,DC| Stack]),
                    ok,
                     %% K8sService.abs:432--432
                    put(vars, (get(vars))#{'nOfNewPods' := (maps:get('nOfNewPods', get(vars)) - 1) }),
                Loop([])  end end)
            ([]);
            false ->         ok
        end,
         %% K8sService.abs:436--436
        case (cmp:ge(C:get_val_internal(get(this), 'underDsThresholdCounter'),C:get_val_internal(get(this), 'downscalePeriod'))) and (cmp:gt(C:get_val_internal(get(this), 'nPods'),C:get_val_internal(get(this), 'minPods'))) of
            true ->  %% K8sService.abs:437--437
            put(vars, (get(vars))#{'tmp974630100' => cog:create_task(C:get_val_internal(get(this), 'lb'),'m_getPods',[[]],#task_info{method= <<"getPods"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
             %% K8sService.abs:437--437
            future:await(maps:get('tmp974630100', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% K8sService.abs:437--437
            put(vars, (get(vars))#{'l' => future:get_blocking(maps:get('tmp974630100', get(vars)), Cog, [O,DC| Stack])}),
             %% K8sService.abs:438--438
            T_1 = cog:create_task(O,'m_shutdownPod',[m_ABS_StdLib_funs:f_head(Cog,maps:get('l', get(vars)),[O,DC| Stack]),[]],#task_info{method= <<"shutdownPod"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
            T_1;
            false ->         ok
        end,
         %% K8sService.abs:442--442
        T_2 = cog:create_task(O,'m_resize',[[]],#task_info{method= <<"resize"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_2,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method resize and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:446
 %% K8sService.abs:446
'm_launchPod'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% K8sService.abs:447--447
        put(vars, (get(vars))#{'rm' => object:new(cog:start(Cog,DC, { fun m_K8sUtil_funs:f_res_refresh_scheduler/3, [ queue ] }),class_K8sUtil_ResourcesMonitorObject,[m_K8sUtil_funs:f_name(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack]),C:get_val_internal(get(this), 'nextID'),m_K8sUtil_funs:f_monitorCycle(Cog,C:get_val_internal(get(this), 'pConfig'),[O,DC| Stack]),m_K8sUtil_funs:f_cpuRequest(Cog,C:get_val_internal(get(this), 'pConfig'),[O,DC| Stack]),[]],Cog,[O,DC| Stack])}),
         %% K8sService.abs:448--449
        put(vars, (get(vars))#{'p' => object:new(cog:start(Cog,DC, { fun m_K8sUtil_funs:f_reset_availCpu_scheduler/3, [ queue ] }),class_K8sService_PodObject,[m_K8sUtil_funs:f_name(Cog,C:get_val_internal(get(this), 'sConfig'),[O,DC| Stack]),C:get_val_internal(get(this), 'nextID'),m_K8sUtil_funs:f_compUnitSize(Cog,C:get_val_internal(get(this), 'pConfig'),[O,DC| Stack]),m_K8sUtil_funs:f_cpuRequest(Cog,C:get_val_internal(get(this), 'pConfig'),[O,DC| Stack]),m_K8sUtil_funs:f_cpuLimit(Cog,C:get_val_internal(get(this), 'pConfig'),[O,DC| Stack]),maps:get('rm', get(vars)),m_K8sUtil_funs:f_memoryCooldown(Cog,C:get_val_internal(get(this), 'pConfig'),[O,DC| Stack]),1,m_K8sUtil_funs:f_costGranularity(Cog,C:get_val_internal(get(this), 'pConfig'),[O,DC| Stack]),[]],Cog,[O,DC| Stack])}),
         %% K8sService.abs:451--451
        T_1 = cog:create_task(maps:get('rm', get(vars)),'m_setPod',[maps:get('p', get(vars)),[]],#task_info{method= <<"setPod"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
         %% K8sService.abs:452--452
        put(vars, (get(vars))#{'tmp150309335' => cog:create_task(C:get_val_internal(get(this), 'scheduler'),'m_deployPod',[maps:get('p', get(vars)),maps:get('rm', get(vars)),[]],#task_info{method= <<"deployPod"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:452--452
        future:await(maps:get('tmp150309335', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:452--452
        put(vars, (get(vars))#{'n' => future:get_blocking(maps:get('tmp150309335', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:453--453
        T_2 = cog:create_task(maps:get('p', get(vars)),'m_setNode',[maps:get('n', get(vars)),[]],#task_info{method= <<"setNode"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_2,
         %% K8sService.abs:454--454
        T_3 = cog:create_task(maps:get('rm', get(vars)),'m_setNode',[maps:get('n', get(vars)),[]],#task_info{method= <<"setNode"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_3,
         %% K8sService.abs:455--455
        T_4 = cog:create_task(C:get_val_internal(get(this), 'lb'),'m_addPod',[maps:get('p', get(vars)),maps:get('rm', get(vars)),[]],#task_info{method= <<"addPod"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_4,
         %% K8sService.abs:457--457
        put(this, C:set_val_internal(get(this), 'nextID',(C:get_val_internal(get(this), 'nextID') + 1) )),
         %% K8sService.abs:458--458
        put(this, C:set_val_internal(get(this), 'nPods',(C:get_val_internal(get(this), 'nPods') + 1) )),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method launchPod and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:461
 %% K8sService.abs:461
'm_shutdownPod'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_p_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'p' => V_p_0 }),
    try
         %% K8sService.abs:462--462
        put(vars, (get(vars))#{'rm' => m_ABS_StdLib_funs:f_snd(Cog,maps:get('p', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:463--463
        put(vars, (get(vars))#{'tmp1708793022' => cog:create_task(maps:get('rm', get(vars)),'m_getNode',[[]],#task_info{method= <<"getNode"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:463--463
        future:await(maps:get('tmp1708793022', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:463--463
        put(vars, (get(vars))#{'n' => future:get_blocking(maps:get('tmp1708793022', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:465--465
        put(vars, (get(vars))#{'tmp445729280' => cog:create_task(C:get_val_internal(get(this), 'lb'),'m_removePod',[m_ABS_StdLib_funs:f_fst(Cog,maps:get('p', get(vars)),[O,DC| Stack]),[]],#task_info{method= <<"removePod"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:465--465
        future:await(maps:get('tmp445729280', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:466--466
        T_1 = cog:create_task(maps:get('n', get(vars)),'m_removePod',[m_ABS_StdLib_funs:f_fst(Cog,maps:get('p', get(vars)),[O,DC| Stack]),m_ABS_StdLib_funs:f_snd(Cog,maps:get('p', get(vars)),[O,DC| Stack]),[]],#task_info{method= <<"removePod"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
        T_1,
         %% K8sService.abs:468--468
        put(this, C:set_val_internal(get(this), 'nPods',(C:get_val_internal(get(this), 'nPods') - 1) )),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method shutdownPod and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
