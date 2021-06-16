-module(class_K8sService_RandomLbPolicy).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceLoadBalancerPolicy">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_RandomLbPolicy,'lb'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:550
'get_val_internal'(#state{'lb'=G},'lb')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:550
'set_val_internal'(S,'lb',V)->
    S#state{'lb'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'lb', S#state.'lb' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
     %% K8sService.abs:550--550
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:552
 %% K8sService.abs:552
'm_distributeRequest'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_req_0,V_activePods_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'req' => V_req_0,
 'activePods' => V_activePods_0 }),
    try
         %% K8sService.abs:553--553
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:554--554
        put(vars, (get(vars))#{'nPods' => m_ABS_StdLib_funs:f_length(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:555--555
        put(vars, (get(vars))#{'batchSize' => m_K8sUtil_funs:f_batchSize(Cog,maps:get('req', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:557--557
        []=(fun Loop ([])->
            case cmp:gt(maps:get('batchSize', get(vars)),0) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:558--558
                put(vars, (get(vars))#{'chosen' => builtin:random(Cog,maps:get('nPods', get(vars)))}),
                 %% K8sService.abs:559--559
                put(vars, (get(vars))#{'p' => m_ABS_StdLib_funs:f_nth(Cog,maps:get('activePods', get(vars)),maps:get('chosen', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:561--561
                put(vars, (get(vars))#{'currentValue' => m_ABS_StdLib_funs:f_lookupDefault(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),-1,[O,DC| Stack])}),
                 %% K8sService.abs:563--563
                case (not cmp:eq(maps:get('currentValue', get(vars)),-1)) of
                    true ->  %% K8sService.abs:564--564
                    put(vars, (get(vars))#{'currentValue' := (maps:get('currentValue', get(vars)) + 1) }),
                     %% K8sService.abs:565--565
                    put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_put(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),maps:get('currentValue', get(vars)),[O,DC| Stack])});
                    false ->                  %% K8sService.abs:567--567
                put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_insert(Cog,maps:get('result', get(vars)),{ dataPair,maps:get('p', get(vars)),1},[O,DC| Stack])})
                end,
                 %% K8sService.abs:569--569
                put(vars, (get(vars))#{'batchSize' := (maps:get('batchSize', get(vars)) - 1) }),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:571--571
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method distributeRequest and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:574
 %% K8sService.abs:574
'm_setLb'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_lb_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'lb' => V_lb_0 }),
    try
         %% K8sService.abs:575--575
        put(this, C:set_val_internal(get(this), 'lb',maps:get('lb', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setLb and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
