include_recipe "diamond::default"

diamond_collector "ElasticSearchCollector" do
    enabled true
end
