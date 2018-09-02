<!-- G4ParticleHPManager.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 11:34:41 2018 (+0800)
;; Last-Updated: 日 9月  2 11:43:38 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPManager

**静态类**

Manager of NeutronHP 


解压缩高精度数据.z文件

```cpp
      void GetDataStream( G4String , std::istringstream& iss );
      void GetDataStream2( G4String , std::istringstream& iss );
```


```
G4bool USE_ONLY_PHOTONEVAPORATION;   getenv( "G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION" )
G4bool SKIP_MISSING_ISOTOPES;   getenv( "G4NEUTRONHP_SKIP_MISSING_ISOTOPES" )
G4bool NEGLECT_DOPPLER;   getenv( "G4NEUTRONHP_NEGLECT_DOPPLER" ) || getenv("G4PHP_NEGLECT_DOPPLER")
G4bool DO_NOT_ADJUST_FINAL_STATE;   getenv( "G4NEUTRONHP_DO_NOT_ADJUST_FINAL_STATE" )  || getenv("G4PHP_DO_NOT_ADJUST_FINAL_STATE")
G4bool PRODUCE_FISSION_FRAGMENTS;   getenv( "G4NEUTRONHP_PRODUCE_FISSION_FRAGMENTS" )
G4bool USE_NRESP71_MODEL;   getenv( "G4PHP_USE_NRESP71_MODEL" ) 

或者

void SetUseOnlyPhotoEvaporation( G4bool val ) { USE_ONLY_PHOTONEVAPORATION = val; };
void SetSkipMissingIsotopes( G4bool val ) { SKIP_MISSING_ISOTOPES = val; };
void SetNeglectDoppler( G4bool val ) { NEGLECT_DOPPLER = val; };
void SetDoNotAdjustFinalState( G4bool val ) { DO_NOT_ADJUST_FINAL_STATE = val; };
void SetProduceFissionFragments( G4bool val ) { PRODUCE_FISSION_FRAGMENTS = val; };
void SetUseNRESP71Model( G4bool val ) { USE_NRESP71_MODEL = val; };
```

## class

```cpp
   public:
      static G4ParticleHPManager* GetInstance() {
         if ( instance == NULL) instance = new G4ParticleHPManager();
         return instance;
      };

   private: 
      G4ParticleHPManager();
      G4ParticleHPManager( const G4ParticleHPManager& ){};
      ~G4ParticleHPManager();
      //static G4ThreadLocal G4ParticleHPManager* instance;
      static G4ParticleHPManager* instance;

   public:
      G4ParticleHPReactionWhiteBoard* GetReactionWhiteBoard();
      void OpenReactionWhiteBoard();
      //void CloseReactionWhiteBoard(){delete RWB; RWB=NULL;};
      void CloseReactionWhiteBoard();

      void GetDataStream( G4String , std::istringstream& iss );
      void GetDataStream2( G4String , std::istringstream& iss );
      void SetVerboseLevel( G4int i ); 
      G4int GetVerboseLevel() {return verboseLevel; }; 

      void DumpDataSource();

      G4bool GetUseOnlyPhotoEvaporation() { return USE_ONLY_PHOTONEVAPORATION; };
      void SetUseOnlyPhotoEvaporation( G4bool val ) { USE_ONLY_PHOTONEVAPORATION = val; };
      G4bool GetSkipMissingIsotopes() { return SKIP_MISSING_ISOTOPES; };
      G4bool GetNeglectDoppler() { return NEGLECT_DOPPLER; };
      G4bool GetDoNotAdjustFinalState() { return DO_NOT_ADJUST_FINAL_STATE; };
      G4bool GetProduceFissionFragments() { return PRODUCE_FISSION_FRAGMENTS; };
      G4bool GetUseNRESP71Model() { return USE_NRESP71_MODEL; };

      void SetSkipMissingIsotopes( G4bool val ) { SKIP_MISSING_ISOTOPES = val; };
      void SetNeglectDoppler( G4bool val ) { NEGLECT_DOPPLER = val; };
      void SetDoNotAdjustFinalState( G4bool val ) { DO_NOT_ADJUST_FINAL_STATE = val; };
      void SetProduceFissionFragments( G4bool val ) { PRODUCE_FISSION_FRAGMENTS = val; };
      void SetUseNRESP71Model( G4bool val ) { USE_NRESP71_MODEL = val; };

      void RegisterElasticCrossSections( G4PhysicsTable* val ){ theElasticCrossSections = val; };
      G4PhysicsTable* GetElasticCrossSections(){ return theElasticCrossSections; };
      void RegisterCaptureCrossSections( G4PhysicsTable* val ){ theCaptureCrossSections = val; };
      G4PhysicsTable* GetCaptureCrossSections(){ return theCaptureCrossSections; };
      void RegisterInelasticCrossSections( const G4ParticleDefinition* , G4PhysicsTable* );
      G4PhysicsTable* GetInelasticCrossSections(const G4ParticleDefinition* );
      void RegisterFissionCrossSections( G4PhysicsTable* val ){ theFissionCrossSections = val; };
      G4PhysicsTable* GetFissionCrossSections(){ return theFissionCrossSections; };

      std::vector<G4ParticleHPChannel*>* GetElasticFinalStates() { return theElasticFSs; };
      void RegisterElasticFinalStates( std::vector<G4ParticleHPChannel*>* val ) { theElasticFSs = val; };
      std::vector<G4ParticleHPChannelList*>* GetInelasticFinalStates( const G4ParticleDefinition* );
      void RegisterInelasticFinalStates( const G4ParticleDefinition* , std::vector<G4ParticleHPChannelList*>* );
      std::vector<G4ParticleHPChannel*>* GetCaptureFinalStates() { return theCaptureFSs; };
      void RegisterCaptureFinalStates( std::vector<G4ParticleHPChannel*>* val ) { theCaptureFSs = val; };
      std::vector<G4ParticleHPChannel*>* GetFissionFinalStates() { return theFissionFSs; };
      void RegisterFissionFinalStates( std::vector<G4ParticleHPChannel*>* val ) { theFissionFSs = val; };

      std::map<G4int,std::map<G4double,G4ParticleHPVector*>*>* GetThermalScatteringCoherentCrossSections() { return theTSCoherentCrossSections; };
      void RegisterThermalScatteringCoherentCrossSections( std::map<G4int,std::map<G4double,G4ParticleHPVector*>*>* val ) { theTSCoherentCrossSections = val; };
      std::map<G4int,std::map<G4double,G4ParticleHPVector*>*>* GetThermalScatteringIncoherentCrossSections() { return theTSIncoherentCrossSections; };
      void RegisterThermalScatteringIncoherentCrossSections( std::map<G4int,std::map<G4double,G4ParticleHPVector*>*>* val ) { theTSIncoherentCrossSections = val; };
      std::map<G4int,std::map<G4double,G4ParticleHPVector*>*>* GetThermalScatteringInelasticCrossSections() { return theTSInelasticCrossSections; };
      void RegisterThermalScatteringInelasticCrossSections( std::map<G4int,std::map<G4double,G4ParticleHPVector*>*>* val ) { theTSInelasticCrossSections = val; }; 

      std::map < G4int , std::map < G4double , std::vector < std::pair< G4double , G4double >* >* >* >* GetThermalScatteringCoherentFinalStates(){ return theTSCoherentFinalStates; };
      void RegisterThermalScatteringCoherentFinalStates( std::map < G4int , std::map < G4double , std::vector < std::pair< G4double , G4double >* >* >* >* val ) { theTSCoherentFinalStates = val; };
      std::map < G4int , std::map < G4double , std::vector < E_isoAng* >* >* >* GetThermalScatteringIncoherentFinalStates(){ return theTSIncoherentFinalStates; };
      void RegisterThermalScatteringIncoherentFinalStates( std::map < G4int , std::map < G4double , std::vector < E_isoAng* >* >* >* val ) { theTSIncoherentFinalStates = val; };
      std::map < G4int , std::map < G4double , std::vector < E_P_E_isoAng* >* >* >* GetThermalScatteringInelasticFinalStates(){ return theTSInelasticFinalStates; };
      void RegisterThermalScatteringInelasticFinalStates( std::map < G4int , std::map < G4double , std::vector < E_P_E_isoAng* >* >* >* val ) { theTSInelasticFinalStates = val; };


   private:
      void register_data_file( G4String , G4String );
      std::map<G4String,G4String> mDataEvaluation;
      /*G4ParticleHPReactionWhiteBoard* RWB;*/

      G4int verboseLevel;

      G4ParticleHPMessenger* messenger;
      G4bool USE_ONLY_PHOTONEVAPORATION;
      G4bool SKIP_MISSING_ISOTOPES;
      G4bool NEGLECT_DOPPLER;
      G4bool DO_NOT_ADJUST_FINAL_STATE;
      G4bool PRODUCE_FISSION_FRAGMENTS;
      G4bool USE_NRESP71_MODEL;

      G4PhysicsTable* theElasticCrossSections;
      G4PhysicsTable* theCaptureCrossSections;
      std::map< const G4ParticleDefinition* , G4PhysicsTable* > theInelasticCrossSections;
      G4PhysicsTable* theFissionCrossSections;

      std::vector<G4ParticleHPChannel*>* theElasticFSs;
      std::map< const G4ParticleDefinition* , std::vector<G4ParticleHPChannelList*>* > theInelasticFSs;
      std::vector<G4ParticleHPChannel*>* theCaptureFSs;
      std::vector<G4ParticleHPChannel*>* theFissionFSs;

      std::map< G4int , std::map< G4double , G4ParticleHPVector* >* >* theTSCoherentCrossSections;
      std::map< G4int , std::map< G4double , G4ParticleHPVector* >* >* theTSIncoherentCrossSections;
      std::map< G4int , std::map< G4double , G4ParticleHPVector* >* >* theTSInelasticCrossSections;

      std::map< G4int , std::map< G4double , std::vector< std::pair< G4double , G4double >* >* >* >* theTSCoherentFinalStates;
      std::map< G4int , std::map< G4double , std::vector< E_isoAng* >* >* >* theTSIncoherentFinalStates;
      std::map< G4int , std::map< G4double , std::vector< E_P_E_isoAng* >* >* >* theTSInelasticFinalStates;
```

<!-- G4ParticleHPManager.md ends here -->
