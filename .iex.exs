{:ok, colaUnoPid} = ColaActivaDynamicSupervisor.start_child(:uno)
{:ok, consumerUnoPid} = ConsumerDynamicSupervisor.start_child(:uno)
{:ok, consumerDosPid} = ConsumerDynamicSupervisor.start_child(:dos)
GenStage.sync_subscribe(consumerUnoPid, to: colaUnoPid)
GenStage.sync_subscribe(consumerDosPid, to: colaUnoPid)