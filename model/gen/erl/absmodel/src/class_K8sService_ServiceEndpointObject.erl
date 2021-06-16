-module(class_K8sService_ServiceEndpointObject).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceEndpoint">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_ServiceEndpointObject,'lb'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:478
'get_val_internal'(#state{'lb'=G},'lb')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:478
'set_val_internal'(S,'lb',V)->
    S#state{'lb'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'lb', S#state.'lb' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_lb,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'lb',P_lb)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:480
 %% K8sService.abs:480
'm_invokeService'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_request_0,V_pf_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'request' => V_request_0,
 'pf' => V_pf_0 }),
    try
         %% K8sService.abs:481--481
        put(vars, (get(vars))#{'started' => m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack])}),
         %% K8sService.abs:482--482
        put(vars, (get(vars))#{'responseTime' => 0}),
         %% K8sService.abs:484--484
        put(vars, (get(vars))#{'batchSize' => m_K8sUtil_funs:f_batchSize(Cog,maps:get('request', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:485--485
        put(vars, (get(vars))#{'scheduled' => m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:487--487
        put(vars, (get(vars))#{'avgResponseTimes' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:493--493
        put(vars, (get(vars))#{'tmp493302922' => cog:create_task(C:get_val_internal(get(this), 'lb'),'m_distributeRequest',[maps:get('request', get(vars)),[]],#task_info{method= <<"distributeRequest"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
         %% K8sService.abs:493--493
        future:await(maps:get('tmp493302922', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% K8sService.abs:493--493
        put(vars, (get(vars))#{'scheduled' := future:get_blocking(maps:get('tmp493302922', get(vars)), Cog, [O,DC| Stack])}),
         %% K8sService.abs:505--519
        put(vars, (get(vars))#{'tmp1530060977' => m_ABS_StdLib_funs:f_elements(Cog,m_ABS_StdLib_funs:f_keys(Cog,maps:get('scheduled', get(vars)),[O,DC| Stack]),[O,DC| Stack])}),
         %% K8sService.abs:505--519
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1530060977', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:505--519
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1530060977', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:505--519
                put(vars, (get(vars))#{'tmp1530060977' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1530060977', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:507--507
                put(vars, (get(vars))#{'nOfReq' => m_ABS_StdLib_funs:f_lookupDefault(Cog,maps:get('scheduled', get(vars)),maps:get('p', get(vars)),0,[O,DC| Stack])}),
                 %% K8sService.abs:508--508
                put(vars, (get(vars))#{'reqRatio' =>  rationals:rdiv(maps:get('nOfReq', get(vars)),m_K8sUtil_funs:f_batchSize(Cog,maps:get('request', get(vars)),[O,DC| Stack])) }),
                 %% K8sService.abs:509--509
                put(vars, (get(vars))#{'requestCost' => ( rationals:mul(m_K8sUtil_funs:f_requestCost(Cog,maps:get('request', get(vars)),[O,DC| Stack]),maps:get('reqRatio', get(vars)))) }),
                 %% K8sService.abs:510--510
                put(vars, (get(vars))#{'requestMemory' => ( rationals:mul(m_K8sUtil_funs:f_memory(Cog,maps:get('request', get(vars)),[O,DC| Stack]),maps:get('reqRatio', get(vars)))) }),
                 %% K8sService.abs:511--511
                put(vars, (get(vars))#{'sortedRequest' => { dataRequest,m_K8sUtil_funs:f_requestType(Cog,maps:get('request', get(vars)),[O,DC| Stack]),maps:get('requestCost', get(vars)),maps:get('requestMemory', get(vars)),maps:get('nOfReq', get(vars)),m_K8sUtil_funs:f_timeBaseline(Cog,maps:get('request', get(vars)),[O,DC| Stack]),m_K8sUtil_funs:f_cpuSysLoadPerCostUnit(Cog,maps:get('request', get(vars)),[O,DC| Stack])}}),
                 %% K8sService.abs:516--516
                put(vars, (get(vars))#{'aRTime' => cog:create_task(maps:get('p', get(vars)),'m_processRequest',[maps:get('sortedRequest', get(vars)),m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[]],#task_info{method= <<"processRequest"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
                 %% K8sService.abs:517--517
                put(vars, (get(vars))#{'avgResponseTime' => { dataPair,maps:get('aRTime', get(vars)),m_K8sUtil_funs:f_batchSize(Cog,maps:get('sortedRequest', get(vars)),[O,DC| Stack])}}),
                 %% K8sService.abs:518--518
                put(vars, (get(vars))#{'avgResponseTimes' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('avgResponseTimes', get(vars)),maps:get('avgResponseTime', get(vars)),[O,DC| Stack])}),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:521--521
        put(vars, (get(vars))#{'nOfCalls' => m_ABS_StdLib_funs:f_length(Cog,maps:get('avgResponseTimes', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:523--523
        []=(fun Loop ([])->
            case cmp:gt(maps:get('nOfCalls', get(vars)),0) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:524--524
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_head(Cog,maps:get('avgResponseTimes', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:525--525
                put(vars, (get(vars))#{'v' => m_ABS_StdLib_funs:f_fst(Cog,maps:get('p', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:526--526
                future:await(maps:get('v', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% K8sService.abs:527--527
                put(vars, (get(vars))#{'val' => future:get_blocking(maps:get('v', get(vars)), Cog, [O,DC| Stack])}),
                 %% K8sService.abs:529--529
                put(vars, (get(vars))#{'val' := builtin:rat(Cog,m_K8sUtil_funs:f_polFuncEval(Cog,maps:get('pf', get(vars)),builtin:float(Cog,maps:get('val', get(vars))),[O,DC| Stack]))}),
                 %% K8sService.abs:531--531
                put(vars, (get(vars))#{'responseTime' := ( rationals:add(maps:get('responseTime', get(vars)),( rationals:mul(maps:get('val', get(vars)),m_ABS_StdLib_funs:f_snd(Cog,maps:get('p', get(vars)),[O,DC| Stack]))) )) }),
                 %% K8sService.abs:532--532
                put(vars, (get(vars))#{'avgResponseTimes' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('avgResponseTimes', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:533--533
                put(vars, (get(vars))#{'nOfCalls' := (maps:get('nOfCalls', get(vars)) - 1) }),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:535--535
        put(vars, (get(vars))#{'responseTime' :=  rationals:rdiv(maps:get('responseTime', get(vars)),maps:get('batchSize', get(vars))) }),
         %% K8sService.abs:537--537
        maps:get('responseTime', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method invokeService and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
