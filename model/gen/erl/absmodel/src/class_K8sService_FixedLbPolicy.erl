-module(class_K8sService_FixedLbPolicy).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ServiceLoadBalancerPolicy">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_K8sService_FixedLbPolicy,'pLoads'=null,'lb'=null}).
'init_internal'()->
    #state{}.

 %% K8sService.abs:781
'get_val_internal'(#state{'pLoads'=G},'pLoads')->
    G;
 %% K8sService.abs:782
'get_val_internal'(#state{'lb'=G},'lb')->
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% K8sService.abs:781
'set_val_internal'(S,'pLoads',V)->
    S#state{'pLoads'=V};
 %% K8sService.abs:782
'set_val_internal'(S,'lb',V)->
    S#state{'lb'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'pLoads', S#state.'pLoads' }
        , { 'lb', S#state.'lb' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_pLoads,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'pLoads',P_pLoads)),
     %% K8sService.abs:782--782
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% K8sService.abs:784
 %% K8sService.abs:784
'm_distributeRequest'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_req_0,V_actPods_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'req' => V_req_0,
 'actPods' => V_actPods_0 }),
    try
         %% K8sService.abs:785--785
        put(vars, (get(vars))#{'activePods' => m_K8sService_funs:f_map_ABS_StdLib_Anon0__(Cog,maps:get('actPods', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:786--786
        put(vars, (get(vars))#{'podsLoads' => m_K8sService_funs:f_map_ABS_StdLib_Anon1__(Cog,C:get_val_internal(get(this), 'pLoads'),[O,DC| Stack])}),
         %% K8sService.abs:788--788
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:790--790
        put(vars, (get(vars))#{'nPods' => m_ABS_StdLib_funs:f_length(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:791--791
        put(vars, (get(vars))#{'nLoads' => m_ABS_StdLib_funs:f_length(Cog,maps:get('podsLoads', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:792--792
        put(vars, (get(vars))#{'effectivePods' => 0}),
         %% K8sService.abs:793--793
        put(vars, (get(vars))#{'p' => null}),
         %% K8sService.abs:795--795
        case cmp:le(maps:get('nLoads', get(vars)),maps:get('nPods', get(vars))) of
            true ->  %% K8sService.abs:796--796
            put(vars, (get(vars))#{'effectivePods' := maps:get('nLoads', get(vars))});
            false ->          %% K8sService.abs:798--798
        put(vars, (get(vars))#{'effectivePods' := maps:get('nPods', get(vars))}),
         %% K8sService.abs:799--799
        put(vars, (get(vars))#{'i' => 0}),
         %% K8sService.abs:800--800
        put(vars, (get(vars))#{'loads' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% K8sService.abs:801--801
        []=(fun Loop ([])->
            case cmp:lt(maps:get('i', get(vars)),maps:get('effectivePods', get(vars))) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:802--802
                put(vars, (get(vars))#{'v1' => m_ABS_StdLib_funs:f_head(Cog,maps:get('podsLoads', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:803--803
                put(vars, (get(vars))#{'podsLoads' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('podsLoads', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:804--804
                put(vars, (get(vars))#{'loads' := m_ABS_StdLib_funs:f_appendright(Cog,maps:get('loads', get(vars)),maps:get('v1', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:805--805
                put(vars, (get(vars))#{'i' := (maps:get('i', get(vars)) + 1) }),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:807--807
        put(vars, (get(vars))#{'podsLoads' := maps:get('loads', get(vars))})
        end,
         %% K8sService.abs:810--810
        put(vars, (get(vars))#{'batchSize' => m_K8sUtil_funs:f_batchSize(Cog,maps:get('req', get(vars)),[O,DC| Stack])}),
         %% K8sService.abs:811--811
        put(vars, (get(vars))#{'remainingBsize' => maps:get('batchSize', get(vars))}),
         %% K8sService.abs:813--813
        put(vars, (get(vars))#{'totalCons' => m_K8sService_funs:f_foldl_ABS_StdLib_Anon2__(Cog,maps:get('podsLoads', get(vars)),0.0,[O,DC| Stack])}),
         %% K8sService.abs:814--814
        put(vars, (get(vars))#{'c' => 0}),
         %% K8sService.abs:815--815
        []=(fun Loop ([])->
            case cmp:lt(maps:get('c', get(vars)),maps:get('effectivePods', get(vars))) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% K8sService.abs:816--816
                put(vars, (get(vars))#{'p' := m_ABS_StdLib_funs:f_head(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:817--817
                put(vars, (get(vars))#{'activePods' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('activePods', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:819--819
                put(vars, (get(vars))#{'v' => m_ABS_StdLib_funs:f_head(Cog,maps:get('podsLoads', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:820--820
                put(vars, (get(vars))#{'podsLoads' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('podsLoads', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:822--822
                put(vars, (get(vars))#{'size' => builtin:floor(Cog,(builtin:float(Cog,maps:get('batchSize', get(vars))) * maps:get('v', get(vars)) / maps:get('totalCons', get(vars))) )}),
                 %% K8sService.abs:824--824
                case cmp:eq(maps:get('c', get(vars)),(maps:get('effectivePods', get(vars)) - 1) ) of
                    true ->  %% K8sService.abs:825--825
                    put(vars, (get(vars))#{'size' := maps:get('remainingBsize', get(vars))});
                    false ->                 ok
                end,
                 %% K8sService.abs:828--828
                put(vars, (get(vars))#{'result' := m_ABS_StdLib_funs:f_put(Cog,maps:get('result', get(vars)),maps:get('p', get(vars)),maps:get('size', get(vars)),[O,DC| Stack])}),
                 %% K8sService.abs:829--829
                put(vars, (get(vars))#{'remainingBsize' := (maps:get('remainingBsize', get(vars)) - maps:get('size', get(vars))) }),
                 %% K8sService.abs:831--831
                put(vars, (get(vars))#{'c' := (maps:get('c', get(vars)) + 1) }),
            Loop([])  end end)
        ([]),
         %% K8sService.abs:838--838
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method distributeRequest and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% K8sService.abs:841
 %% K8sService.abs:841
'm_setLb'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_lb_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'lb' => V_lb_0 }),
    try
         %% K8sService.abs:842--842
        put(this, C:set_val_internal(get(this), 'lb',maps:get('lb', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setLb and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
