<!-- G4LossTableManager.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 7月 13 04:15:20 2018 (+0800)
;; Last-Updated: 六 7月 14 02:54:10 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4LossTableManager

A utility static class, responsable for the energy loss tables for each particle

Energy loss processes have to register their tables with this class. The responsibility of creating and deleting the tables remains with the energy loss classes.




## class

```cpp
friend class G4ThreadLocalSingleton<G4LossTableManager>;

public:

  static G4LossTableManager* Instance();

  ~G4LossTableManager();

  //-------------------------------------------------
  // called from destructor
  //-------------------------------------------------

  void Clear();

  //-------------------------------------------------
  // initialisation before a new run
  //-------------------------------------------------

  void PreparePhysicsTable(const G4ParticleDefinition* aParticle,
                           G4VEnergyLossProcess* p, G4bool theMaster);

  void PreparePhysicsTable(const G4ParticleDefinition* aParticle,
                           G4VEmProcess* p, G4bool theMaster);

  void PreparePhysicsTable(const G4ParticleDefinition* aParticle,
                           G4VMultipleScattering* p, G4bool theMaster);

  void BuildPhysicsTable(const G4ParticleDefinition* aParticle);

  void BuildPhysicsTable(const G4ParticleDefinition* aParticle, 
                         G4VEnergyLossProcess* p);

  void LocalPhysicsTables(const G4ParticleDefinition* aParticle, 
                          G4VEnergyLossProcess* p);
 
  void DumpHtml();

  //-------------------------------------------------
  // Run time access to DEDX, range, energy for a given particle, 
  // energy, and G4MaterialCutsCouple
  //-------------------------------------------------

  inline G4double GetDEDX(
    const G4ParticleDefinition *aParticle,
    G4double kineticEnergy,
    const G4MaterialCutsCouple *couple);

  inline G4double GetSubDEDX(
    const G4ParticleDefinition *aParticle,
    G4double kineticEnergy,
    const G4MaterialCutsCouple *couple);

  inline G4double GetRange(
    const G4ParticleDefinition *aParticle,
    G4double kineticEnergy,
    const G4MaterialCutsCouple *couple);

  inline G4double GetCSDARange(
    const G4ParticleDefinition *aParticle,
    G4double kineticEnergy,
    const G4MaterialCutsCouple *couple);

  inline G4double GetRangeFromRestricteDEDX(
    const G4ParticleDefinition *aParticle,
    G4double kineticEnergy,
    const G4MaterialCutsCouple *couple);

  inline G4double GetEnergy(
    const G4ParticleDefinition *aParticle,
    G4double range,
    const G4MaterialCutsCouple *couple);

  inline G4double GetDEDXDispersion(
    const G4MaterialCutsCouple *couple,
    const G4DynamicParticle* dp,
          G4double& length);

  //-------------------------------------------------
  // Methods to be called only at initialisation
  //-------------------------------------------------

  void Register(G4VEnergyLossProcess* p);

  void DeRegister(G4VEnergyLossProcess* p);

  void Register(G4VMultipleScattering* p);

  void DeRegister(G4VMultipleScattering* p);

  void Register(G4VEmProcess* p);

  void DeRegister(G4VEmProcess* p);

  void Register(G4VEmModel* p);

  void DeRegister(G4VEmModel* p);

  void Register(G4VEmFluctuationModel* p);

  void DeRegister(G4VEmFluctuationModel* p);

  void RegisterExtraParticle(const G4ParticleDefinition* aParticle, 
                             G4VEnergyLossProcess* p);

  void SetVerbose(G4int val);

  void SetAtomDeexcitation(G4VAtomDeexcitation*);

  void SetSubCutProducer(G4VSubCutProducer*);

  //-------------------------------------------------
  // Access methods
  //-------------------------------------------------

  inline G4bool IsMaster() const;

  inline 
  G4VEnergyLossProcess* GetEnergyLossProcess(const G4ParticleDefinition*);
 
  const std::vector<G4VEnergyLossProcess*>& GetEnergyLossProcessVector();

  const std::vector<G4VEmProcess*>& GetEmProcessVector();

  const std::vector<G4VMultipleScattering*>& GetMultipleScatteringVector();

  G4EmSaturation* EmSaturation();

  G4EmConfigurator* EmConfigurator();

  G4ElectronIonPair* ElectronIonPair();

  inline G4EmCorrections* EmCorrections();

  inline G4VAtomDeexcitation* AtomDeexcitation();

  inline G4VSubCutProducer* SubCutProducer();

  inline G4LossTableBuilder* GetTableBuilder();

  inline void SetGammaShark(G4GammaShark*); 

  inline G4GammaShark* GetGammaShark(); 

private:

  //-------------------------------------------------
  // Private methods and members
  //-------------------------------------------------

  G4LossTableManager();

  void ResetParameters();

  G4VEnergyLossProcess* BuildTables(const G4ParticleDefinition* aParticle);

  void CopyTables(const G4ParticleDefinition* aParticle, 
                  G4VEnergyLossProcess*);

  void ParticleHaveNoLoss(const G4ParticleDefinition* aParticle);

  void CopyDEDXTables();

  void PrintEWarning(G4String, G4double);

  G4LossTableManager(G4LossTableManager &) = delete;
  G4LossTableManager & operator=(const G4LossTableManager &right) = delete;
```




<!-- G4LossTableManager.md ends here -->
