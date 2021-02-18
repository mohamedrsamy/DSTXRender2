```mermaid
       graph TB
         
         
         
         		subgraph  LoadCLIENTS
         	subgraph variables-LoadCLIENTS
         
         Hub_Count[Name= Hub_Count Value= 0]
         	
         
         LoadID[Name= LoadID Value= 0]
         	
         
         
         end
         
         
         		subgraph  NotifyStartLoadPackageStatus
         
         
         
         		end
         
         
         		subgraph  LoadDataVault
         	subgraph variables-Load Data Vault
         
         HubCount[Name= HubCount Value= 0]
         	
         
         
         end
         
         
         		subgraph  TruncateStageTable
         
         
         
         		end
         
         
         		subgraph  GetHubCount
         
         
         
         		end
         
         
         		subgraph  LoadH_CLIENTS
         
         
         
         		end
         
         
         		subgraph  LoadSatellitefirsttime
         
         
         
         		end
         
         
         		subgraph  TruncateDimTable
         
         
         
         		end
         
         
         		subgraph  LoadDimTableforfirsttime
         
         
         
         		end
         
         
         		subgraph  LoadHubSATANDDimwithInsertsandStageUpdates
         
         
         
         		end
         
         
         		subgraph  BulkLoadallupdatesfromstagetable
         
         
         
         		end
         
         TruncateStageTable --> GetHubCount
         
         GetHubCount --> LoadHCLIENTS
         
         LoadHCLIENTS --> LoadSatellitefirsttime
         
         LoadSatellitefirsttime --> TruncateDimTable
         
         TruncateDimTable --> LoadDimTableforfirsttime
         
         GetHubCount --> LoadHubSATANDDimwithInsertsandStageUpdates
         
         LoadHubSATANDDimwithInsertsandStageUpdates --> BulkLoadallupdatesfromstagetable
         
         
         		end
         
         
         		subgraph  LoadStarSchema
         
         		subgraph  UpdateDIMTable
         
         
         
         		end
         
         
         		end
         
         
         		subgraph  UpdatePackageExecutionStatus
         
         
         
         		end
         
         NotifyStartLoadPackageStatus --> LoadDataVault
         
         LoadDataVault --> LoadStarSchema
         
         LoadDataVault --> UpdatePackageExecutionStatus
         
         LoadStarSchema --> UpdatePackageExecutionStatus
         
         
         		end
      		