-module(m_MicroservicesDemoTest1).
-behaviour(application).
-include_lib("../include/abs_types.hrl").
-export([main/1]).
%% Application callbacks
-export([start/2, stop/1]).

'main'(Cog=#cog{ref=CogRef,dcobj=DC})->
    put(vars, #{}),
    C = none,
    Oid = null, % avoid self-call branch in synccall code
    O = #object{oid=Oid,cog=Cog},
    put(this, {state, none}),
    Stack = [DC],
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:56--56
    put(vars, (get(vars))#{'timeUnitSize' => 2}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:57--57
    put(vars, (get(vars))#{'costGranularity' => 100}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:59--59
    put(vars, (get(vars))#{'cp' => object:new(cog:start(Cog,DC),class_ABS_DC_CloudProvider,[<<"Cloud"/utf8>>,[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:60--60
    put(vars, (get(vars))#{'master' => object:new(cog:start(Cog,DC),class_K8sMaster_MasterObject,[maps:get('cp', get(vars)),maps:get('timeUnitSize', get(vars)),1,1,maps:get('costGranularity', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:61--61
    put(vars, (get(vars))#{'fb' => (fun() -> case maps:get('master', get(vars)) of
        null -> throw(dataNullPointerException);
        Callee=#object{oid=Oid,cog=Cog} ->
            %% self-call
            Vars=get(vars),
            Result=C:'m_createNodes'(Callee,4,4000,4000,100,[O,DC,Vars| Stack]),
            put(vars, Vars),
            Result;
        Callee=#object{oid=ObjRef,cog=Cog} ->
            %% cog-local call
            V_nNodes = 4,
            V_cpu = 4000,
            V_memory = 4000,
            V_baseSystemLoad = 100,
            State=get(this),
            Vars=get(vars),
            cog:object_state_changed(Cog, O, State),
            put(this,cog:get_object_state(Callee#object.cog, Callee)),
            put(task_info,(get(task_info))#task_info{this=Callee}),
            T=object:get_class_from_state(get(this)), % it's the callee state already
            Result=T:'m_createNodes'(Callee, V_nNodes, V_cpu, V_memory, V_baseSystemLoad,[O,DC,Vars,State| Stack]),
            cog:object_state_changed(Callee#object.cog, Callee, get(this)),
            put(task_info,(get(task_info))#task_info{this=O}),
            put(this, cog:get_object_state(Cog, O)),
            put(vars, Vars),
            Result;
        Callee ->
            %% remote call
            TempFuture = cog:create_task(Callee,'m_createNodes',[4,4000,4000,100,[]],#task_info{method= <<"createNodes"/utf8>>},Cog, true),
            future:get_blocking(TempFuture, Cog, [O,DC| Stack])
    end end)()}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:63--63
    put(vars, (get(vars))#{'emailserviceServiceConfig' => { dataServiceConfig,<<"emailservice"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:64--64
    put(vars, (get(vars))#{'emailservicePodConfig' => { dataPodConfig,1,1,0,100,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:65--65
    put(vars, (get(vars))#{'checkoutserviceServiceConfig' => { dataServiceConfig,<<"checkoutservice"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:66--66
    put(vars, (get(vars))#{'checkoutservicePodConfig' => { dataPodConfig,1,1,0,100,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:67--67
    put(vars, (get(vars))#{'recommendationserviceServiceConfig' => { dataServiceConfig,<<"recommendationservice"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:68--68
    put(vars, (get(vars))#{'recommendationservicePodConfig' => { dataPodConfig,1,1,0,100,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:69--69
    put(vars, (get(vars))#{'frontendServiceConfig' => { dataServiceConfig,<<"frontend"/utf8>>,5,5,5,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:70--70
    put(vars, (get(vars))#{'frontendPodConfig' => { dataPodConfig,1,1,0,600,3000,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:71--71
    put(vars, (get(vars))#{'paymentserviceServiceConfig' => { dataServiceConfig,<<"paymentservice"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:72--72
    put(vars, (get(vars))#{'paymentservicePodConfig' => { dataPodConfig,1,1,0,100,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:73--73
    put(vars, (get(vars))#{'productcatalogserviceServiceConfig' => { dataServiceConfig,<<"productcatalogservice"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:74--74
    put(vars, (get(vars))#{'productcatalogservicePodConfig' => { dataPodConfig,1,1,0,100,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:75--75
    put(vars, (get(vars))#{'cartserviceServiceConfig' => { dataServiceConfig,<<"cartservice"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:76--76
    put(vars, (get(vars))#{'cartservicePodConfig' => { dataPodConfig,1,1,0,200,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:77--77
    put(vars, (get(vars))#{'currencyserviceServiceConfig' => { dataServiceConfig,<<"currencyservice"/utf8>>,5,5,5,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:78--78
    put(vars, (get(vars))#{'currencyservicePodConfig' => { dataPodConfig,1,1,0,600,1000,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:79--79
    put(vars, (get(vars))#{'shippingserviceServiceConfig' => { dataServiceConfig,<<"shippingservice"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:80--80
    put(vars, (get(vars))#{'shippingservicePodConfig' => { dataPodConfig,1,1,0,100,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:81--81
    put(vars, (get(vars))#{'rediscartServiceConfig' => { dataServiceConfig,<<"rediscart"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:82--82
    put(vars, (get(vars))#{'rediscartPodConfig' => { dataPodConfig,1,1,0,70,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:83--83
    put(vars, (get(vars))#{'adserviceServiceConfig' => { dataServiceConfig,<<"adservice"/utf8>>,2,1,30,1, rationals:rdiv(80,100) , rationals:rdiv(5,100) ,10}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:84--84
    put(vars, (get(vars))#{'adservicePodConfig' => { dataPodConfig,1,1,0,200,500,maps:get('costGranularity', get(vars))}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:86--86
    put(vars, (get(vars))#{'rulesMap' => m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:87--87
    put(vars, (get(vars))#{'rulesMap' := m_ABS_StdLib_funs:f_put(Cog,maps:get('rulesMap', get(vars)),<<"frontend"/utf8>>,m_ABS_StdLib_funs:f_list(Cog,[ 1, 3] ,[O,DC| Stack]),[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:88--88
    put(vars, (get(vars))#{'rulesMap' := m_ABS_StdLib_funs:f_put(Cog,maps:get('rulesMap', get(vars)),<<"currencyservice"/utf8>>,m_ABS_StdLib_funs:f_list(Cog,[ 2, 4] ,[O,DC| Stack]),[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:90--90
    T_1 = (fun() -> case maps:get('master', get(vars)) of
        null -> throw(dataNullPointerException);
        Callee=#object{oid=Oid,cog=Cog} ->
            %% self-call
            Vars=get(vars),
            Result=C:'m_setSchedulerRulesMap'(Callee,maps:get('rulesMap', get(vars)),[O,DC,Vars| Stack]),
            put(vars, Vars),
            Result;
        Callee=#object{oid=ObjRef,cog=Cog} ->
            %% cog-local call
            V_rulesMap = maps:get('rulesMap', get(vars)),
            State=get(this),
            Vars=get(vars),
            cog:object_state_changed(Cog, O, State),
            put(this,cog:get_object_state(Callee#object.cog, Callee)),
            put(task_info,(get(task_info))#task_info{this=Callee}),
            T=object:get_class_from_state(get(this)), % it's the callee state already
            Result=T:'m_setSchedulerRulesMap'(Callee, V_rulesMap,[O,DC,Vars,State| Stack]),
            cog:object_state_changed(Callee#object.cog, Callee, get(this)),
            put(task_info,(get(task_info))#task_info{this=O}),
            put(this, cog:get_object_state(Cog, O)),
            put(vars, Vars),
            Result;
        Callee ->
            %% remote call
            TempFuture = cog:create_task(Callee,'m_setSchedulerRulesMap',[maps:get('rulesMap', get(vars)),[]],#task_info{method= <<"setSchedulerRulesMap"/utf8>>},Cog, true),
            future:get_blocking(TempFuture, Cog, [O,DC| Stack])
    end end)(),
    T_1,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:93--93
    put(vars, (get(vars))#{'policy' => object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:95--95
    put(vars, (get(vars))#{'emailservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('emailserviceServiceConfig', get(vars)),maps:get('emailservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:96--96
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:97--97
    put(vars, (get(vars))#{'checkoutservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('checkoutserviceServiceConfig', get(vars)),maps:get('checkoutservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:98--98
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:99--99
    put(vars, (get(vars))#{'recommendationservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('recommendationserviceServiceConfig', get(vars)),maps:get('recommendationservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:100--100
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:101--101
    put(vars, (get(vars))#{'frontend' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('frontendServiceConfig', get(vars)),maps:get('frontendPodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:102--102
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:103--103
    put(vars, (get(vars))#{'paymentservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('paymentserviceServiceConfig', get(vars)),maps:get('paymentservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:104--104
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:105--105
    put(vars, (get(vars))#{'productcatalogservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('productcatalogserviceServiceConfig', get(vars)),maps:get('productcatalogservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:106--106
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:107--107
    put(vars, (get(vars))#{'cartservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('cartserviceServiceConfig', get(vars)),maps:get('cartservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:108--108
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:109--109
    put(vars, (get(vars))#{'currencyservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('currencyserviceServiceConfig', get(vars)),maps:get('currencyservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:110--110
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:111--111
    put(vars, (get(vars))#{'shippingservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('shippingserviceServiceConfig', get(vars)),maps:get('shippingservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:112--112
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:113--113
    put(vars, (get(vars))#{'rediscart' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('rediscartServiceConfig', get(vars)),maps:get('rediscartPodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:114--114
    put(vars, (get(vars))#{'policy' := object:new(cog:start(Cog,DC),class_K8sService_RoundRobinLbPolicy,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:115--115
    put(vars, (get(vars))#{'adservice' => object:new(cog:start(Cog,DC),class_K8sService_ServiceObject,[maps:get('adserviceServiceConfig', get(vars)),maps:get('adservicePodConfig', get(vars)),maps:get('policy', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:117--119
    put(vars, (get(vars))#{'services' => m_ABS_StdLib_funs:f_list(Cog,[ maps:get('emailservice', get(vars)), maps:get('checkoutservice', get(vars)), maps:get('recommendationservice', get(vars)), maps:get('frontend', get(vars)), maps:get('paymentservice', get(vars)), maps:get('productcatalogservice', get(vars)), maps:get('cartservice', get(vars)), maps:get('currencyservice', get(vars)), maps:get('shippingservice', get(vars)), maps:get('rediscart', get(vars)), maps:get('adservice', get(vars))] ,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:121--123
    put(vars, (get(vars))#{'tmp2069143716' => maps:get('services', get(vars))}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:121--123
    []=(fun Loop ([])->
        case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp2069143716', get(vars)),[O,DC| Stack])) of
        false -> [];
        true -> receive
                {stop_world, CogRef} ->
                    cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                    cog:task_is_runnable(Cog,self()),
                    task:wait_for_token(Cog,[O,DC| Stack])
                after 0 -> ok
            end,
             %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:121--123
            put(vars, (get(vars))#{'s' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp2069143716', get(vars)),[O,DC| Stack])}),
             %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:121--123
            put(vars, (get(vars))#{'tmp2069143716' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp2069143716', get(vars)),[O,DC| Stack])}),
             %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:122--122
            T_2 = (fun() -> case maps:get('master', get(vars)) of
                null -> throw(dataNullPointerException);
                Callee=#object{oid=Oid,cog=Cog} ->
                    %% self-call
                    Vars=get(vars),
                    Result=C:'m_deployService'(Callee,maps:get('s', get(vars)),[O,DC,Vars| Stack]),
                    put(vars, Vars),
                    Result;
                Callee=#object{oid=ObjRef,cog=Cog} ->
                    %% cog-local call
                    V_s = maps:get('s', get(vars)),
                    State=get(this),
                    Vars=get(vars),
                    cog:object_state_changed(Cog, O, State),
                    put(this,cog:get_object_state(Callee#object.cog, Callee)),
                    put(task_info,(get(task_info))#task_info{this=Callee}),
                    T=object:get_class_from_state(get(this)), % it's the callee state already
                    Result=T:'m_deployService'(Callee, V_s,[O,DC,Vars,State| Stack]),
                    cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                    put(task_info,(get(task_info))#task_info{this=O}),
                    put(this, cog:get_object_state(Cog, O)),
                    put(vars, Vars),
                    Result;
                Callee ->
                    %% remote call
                    TempFuture = cog:create_task(Callee,'m_deployService',[maps:get('s', get(vars)),[]],#task_info{method= <<"deployService"/utf8>>},Cog, true),
                    future:get_blocking(TempFuture, Cog, [O,DC| Stack])
            end end)(),
            T_2,
        Loop([])  end end)
    ([]),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:125--125
    put(vars, (get(vars))#{'tmp149111966' => cog:create_task(maps:get('emailservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:125--125
    future:await(maps:get('tmp149111966', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:125--125
    put(vars, (get(vars))#{'emailserviceEP' => future:get_blocking(maps:get('tmp149111966', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:126--126
    put(vars, (get(vars))#{'tmp807661911' => cog:create_task(maps:get('checkoutservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:126--126
    future:await(maps:get('tmp807661911', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:126--126
    put(vars, (get(vars))#{'checkoutserviceEP' => future:get_blocking(maps:get('tmp807661911', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:127--127
    put(vars, (get(vars))#{'tmp523938160' => cog:create_task(maps:get('recommendationservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:127--127
    future:await(maps:get('tmp523938160', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:127--127
    put(vars, (get(vars))#{'recommendationserviceEP' => future:get_blocking(maps:get('tmp523938160', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:128--128
    put(vars, (get(vars))#{'tmp1377024135' => cog:create_task(maps:get('frontend', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:128--128
    future:await(maps:get('tmp1377024135', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:128--128
    put(vars, (get(vars))#{'frontendEP' => future:get_blocking(maps:get('tmp1377024135', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:129--129
    put(vars, (get(vars))#{'tmp1086771695' => cog:create_task(maps:get('paymentservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:129--129
    future:await(maps:get('tmp1086771695', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:129--129
    put(vars, (get(vars))#{'paymentserviceEP' => future:get_blocking(maps:get('tmp1086771695', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:130--130
    put(vars, (get(vars))#{'tmp1866476009' => cog:create_task(maps:get('productcatalogservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:130--130
    future:await(maps:get('tmp1866476009', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:130--130
    put(vars, (get(vars))#{'productcatalogserviceEP' => future:get_blocking(maps:get('tmp1866476009', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:131--131
    put(vars, (get(vars))#{'tmp628845656' => cog:create_task(maps:get('cartservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:131--131
    future:await(maps:get('tmp628845656', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:131--131
    put(vars, (get(vars))#{'cartserviceEP' => future:get_blocking(maps:get('tmp628845656', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:132--132
    put(vars, (get(vars))#{'tmp1793273840' => cog:create_task(maps:get('currencyservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:132--132
    future:await(maps:get('tmp1793273840', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:132--132
    put(vars, (get(vars))#{'currencyserviceEP' => future:get_blocking(maps:get('tmp1793273840', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:133--133
    put(vars, (get(vars))#{'tmp475845354' => cog:create_task(maps:get('shippingservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:133--133
    future:await(maps:get('tmp475845354', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:133--133
    put(vars, (get(vars))#{'shippingserviceEP' => future:get_blocking(maps:get('tmp475845354', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:134--134
    put(vars, (get(vars))#{'tmp1925038057' => cog:create_task(maps:get('rediscart', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:134--134
    future:await(maps:get('tmp1925038057', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:134--134
    put(vars, (get(vars))#{'rediscartEP' => future:get_blocking(maps:get('tmp1925038057', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:135--135
    put(vars, (get(vars))#{'tmp215618634' => cog:create_task(maps:get('adservice', get(vars)),'m_getServiceEndpoint',[[]],#task_info{method= <<"getServiceEndpoint"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:135--135
    future:await(maps:get('tmp215618634', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:135--135
    put(vars, (get(vars))#{'adserviceEP' => future:get_blocking(maps:get('tmp215618634', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:137--137
    put(vars, (get(vars))#{'batchSize' => 320}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:139--139
    put(vars, (get(vars))#{'request1' => { dataRequest,<<"request_1"/utf8>>,3600,1,maps:get('batchSize', get(vars)),0, rationals:rdiv(1,20) }}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:140--140
    put(vars, (get(vars))#{'request2' => { dataRequest,<<"request_2"/utf8>>,2600,1,maps:get('batchSize', get(vars)),0, rationals:rdiv(1,20) }}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:141--141
    put(vars, (get(vars))#{'request3' => { dataRequest,<<"request_3"/utf8>>,400,1,maps:get('batchSize', get(vars)),0, rationals:rdiv(1,20) }}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:142--142
    put(vars, (get(vars))#{'request4' => { dataRequest,<<"request_4"/utf8>>,330,1,maps:get('batchSize', get(vars)),0, rationals:rdiv(1,20) }}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:143--143
    put(vars, (get(vars))#{'request5' => { dataRequest,<<"request_5"/utf8>>,230,1,maps:get('batchSize', get(vars)),0, rationals:rdiv(1,20) }}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:145--145
    put(vars, (get(vars))#{'frontendTask' => object:new(cog:start(Cog,DC),class_K8sWorkflow_ServiceRequest,[maps:get('frontendEP', get(vars)),maps:get('request1', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:146--146
    put(vars, (get(vars))#{'currencyTask' => object:new(cog:start(Cog,DC),class_K8sWorkflow_ServiceRequest,[maps:get('currencyserviceEP', get(vars)),maps:get('request2', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:147--147
    put(vars, (get(vars))#{'cartTask' => object:new(cog:start(Cog,DC),class_K8sWorkflow_ServiceRequest,[maps:get('cartserviceEP', get(vars)),maps:get('request3', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:148--148
    put(vars, (get(vars))#{'productcatalogTask' => object:new(cog:start(Cog,DC),class_K8sWorkflow_ServiceRequest,[maps:get('productcatalogserviceEP', get(vars)),maps:get('request4', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:149--149
    put(vars, (get(vars))#{'adTask' => object:new(cog:start(Cog,DC),class_K8sWorkflow_ServiceRequest,[maps:get('adserviceEP', get(vars)),maps:get('request5', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:151--151
    put(vars, (get(vars))#{'wf1Pf' => { dataPolyFunction,m_ABS_StdLib_funs:f_list(Cog,[ m_ABS_StdLib_funs:f_list(Cog,[ 1863994.69749283, -1373872.18680479, 358906.779556025, -38339.2094534745, 1414.46977103946, -0.0833391048692793] ,[O,DC| Stack])] ,[O,DC| Stack]),m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:152--152
    put(vars, (get(vars))#{'workflow1' => object:new(cog:start(Cog,DC),class_K8sWorkflow_ServiceWorkflow,[[m_ABS_StdLib_funs:f_list(Cog,[ maps:get('frontendTask', get(vars))] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_list(Cog,[ maps:get('currencyTask', get(vars)), maps:get('cartTask', get(vars)), maps:get('productcatalogTask', get(vars)), maps:get('adTask', get(vars))] ,[O,DC| Stack])],35,maps:get('wf1Pf', get(vars)),[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:155--155
    put(vars, (get(vars))#{'printer' => object:new(cog:start(Cog,DC),class_K8sUtil_PrinterObject,[[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:156--156
    put(vars, (get(vars))#{'sList' => m_ABS_StdLib_funs:f_list(Cog,[ maps:get('frontend', get(vars)), maps:get('currencyservice', get(vars)), maps:get('cartservice', get(vars)), maps:get('productcatalogservice', get(vars)), maps:get('adservice', get(vars))] ,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:158--158
    T_2 = cog:create_task(maps:get('printer', get(vars)),'m_printStatus',[maps:get('master', get(vars)),maps:get('sList', get(vars)),80,1,[]],#task_info{method= <<"printStatus"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,false),
    T_2,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:160--160
    cog:suspend_current_task_for_duration(Cog,5,5,[O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:163--163
    put(vars, (get(vars))#{'c1' => object:new(cog:start(Cog,DC),class_MicroservicesDemoTest1_ClientWorkflow,[maps:get('workflow1', get(vars)),70,builtin:rat(Cog,1.0),10,[]],Cog,[O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:164--164
    put(vars, (get(vars))#{'tmp2142582414' => cog:create_task(maps:get('c1', get(vars)),'m_start',[[]],#task_info{method= <<"start"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog,true)}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:164--164
    future:await(maps:get('tmp2142582414', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:164--164
    put(vars, (get(vars))#{'rts' => future:get_blocking(maps:get('tmp2142582414', get(vars)), Cog, [O,DC| Stack])}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:166--168
    put(vars, (get(vars))#{'tmp1747820321' => maps:get('rts', get(vars))}),
     %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:166--168
    []=(fun Loop ([])->
        case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1747820321', get(vars)),[O,DC| Stack])) of
        false -> [];
        true -> receive
                {stop_world, CogRef} ->
                    cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                    cog:task_is_runnable(Cog,self()),
                    task:wait_for_token(Cog,[O,DC| Stack])
                after 0 -> ok
            end,
             %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:166--168
            put(vars, (get(vars))#{'t' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1747820321', get(vars)),[O,DC| Stack])}),
             %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:166--168
            put(vars, (get(vars))#{'tmp1747820321' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1747820321', get(vars)),[O,DC| Stack])}),
             %% tests/UIO_rt_baseline/MsDemoWf1_RR_320rps.abs:167--167
            T_3 = builtin:println(Cog,iolist_to_binary([<<"c1 avg response time:"/utf8>>, builtin:toString(Cog,builtin:float(Cog,maps:get('t', get(vars))))])),
            T_3,
        Loop([])  end end)
    ([]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    runtime:start_link([m_MicroservicesDemoTest1]).

stop(_State) ->
    ok.
