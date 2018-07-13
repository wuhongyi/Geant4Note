<!-- G4VEnergyLossProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 7月 13 04:37:35 2018 (+0800)
;; Last-Updated: 六 7月 14 02:44:26 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4VEnergyLossProcess

It is the unified energy loss process it calculates the continuous energy loss for charged particles using a set of Energy Loss models valid for different energy regions. There are a possibility to create and access to dE/dx and range tables, or to calculate that information on fly.

## class

```cpp
public:

  G4VEnergyLossProcess(const G4String& name = "EnergyLoss",
                       G4ProcessType type = fElectromagnetic);

  virtual ~G4VEnergyLossProcess();

private:
  // clean vectors and arrays
  void Clean();

  //------------------------------------------------------------------------
  // Virtual methods to be implemented in concrete processes
  //------------------------------------------------------------------------

public:
  virtual G4bool IsApplicable(const G4ParticleDefinition& p) override = 0;
  
  // obsolete to be removed
  virtual void PrintInfo() {};

  virtual void ProcessDescription(std::ostream& outFile) const override;

protected:

  virtual void StreamProcessInfo(std::ostream&, G4String) const {};

  virtual void InitialiseEnergyLossProcess(const G4ParticleDefinition*,
                                           const G4ParticleDefinition*) = 0;

  //------------------------------------------------------------------------
  // Methods with standard implementation; may be overwritten if needed 
  //------------------------------------------------------------------------

  virtual G4double MinPrimaryEnergy(const G4ParticleDefinition*,
                                    const G4Material*, G4double cut);

  //------------------------------------------------------------------------
  // Virtual methods implementation common to all EM ContinuousDiscrete 
  // processes. Further inheritance is not assumed 
  //------------------------------------------------------------------------

public:

  // prepare all tables
  virtual void PreparePhysicsTable(const G4ParticleDefinition&) override;

  // build all tables
  virtual void BuildPhysicsTable(const G4ParticleDefinition&) override;

  // build a table
  G4PhysicsTable* BuildDEDXTable(G4EmTableType tType = fRestricted);

  // build a table
  G4PhysicsTable* BuildLambdaTable(G4EmTableType tType = fRestricted);

  // Called before tracking of each new G4Track
  virtual void StartTracking(G4Track*) override;

  // Step limit from AlongStep 
  virtual G4double AlongStepGetPhysicalInteractionLength(
                                  const G4Track&,
                                  G4double  previousStepSize,
                                  G4double  currentMinimumStep,
                                  G4double& currentSafety,
                                  G4GPILSelection* selection) override;

  // Step limit from cross section
  virtual G4double PostStepGetPhysicalInteractionLength(
                                  const G4Track& track,
                                  G4double   previousStepSize,
                                  G4ForceCondition* condition) override;

  // AlongStep computations
  virtual G4VParticleChange* AlongStepDoIt(const G4Track&, 
                                           const G4Step&) override;

  // Sampling of secondaries in vicinity of geometrical boundary
  // Return sum of secodaries energy 
  G4double SampleSubCutSecondaries(std::vector<G4Track*>&, const G4Step&, 
                                   G4VEmModel* model, G4int matIdx); 

  // PostStep sampling of secondaries
  virtual G4VParticleChange* PostStepDoIt(const G4Track&, 
                                          const G4Step&) override;

  // Store all PhysicsTable in files.
  // Return false in case of any fatal failure at I/O  
  virtual G4bool StorePhysicsTable(const G4ParticleDefinition*,
                                   const G4String& directory,
                                   G4bool ascii = false) override;

  // Retrieve all Physics from a files.
  // Return true if all the Physics Table are built.
  // Return false if any fatal failure. 
  virtual G4bool RetrievePhysicsTable(const G4ParticleDefinition*,
                                      const G4String& directory,
                                      G4bool ascii) override;

private:

  // summary printout after initialisation
  void StreamInfo(std::ostream& out, const G4ParticleDefinition& part,
                  G4String endOfLine=G4String("\n")) const;

  // store a table
  G4bool StoreTable(const G4ParticleDefinition* p, 
                    G4PhysicsTable*, G4bool ascii,
                    const G4String& directory, 
                    const G4String& tname);

  // retrieve a table
  G4bool RetrieveTable(const G4ParticleDefinition* p, 
                       G4PhysicsTable*, G4bool ascii,
                       const G4String& directory, 
                       const G4String& tname, 
                       G4bool mandatory);

  //------------------------------------------------------------------------
  // Public interface to cross section, mfp and sampling of fluctuations
  // These methods are not used in run time
  //------------------------------------------------------------------------

public:

  // access to dispersion of restricted energy loss
  G4double GetDEDXDispersion(const G4MaterialCutsCouple *couple,
                             const G4DynamicParticle* dp,
                             G4double length);

  // Access to cross section table
  G4double CrossSectionPerVolume(G4double kineticEnergy,
                                 const G4MaterialCutsCouple* couple);

  // access to cross section
  G4double MeanFreePath(const G4Track& track);

  // access to step limit
  G4double ContinuousStepLimit(const G4Track& track,
                               G4double previousStepSize,
                               G4double currentMinimumStep,
                               G4double& currentSafety);

protected:

  // implementation of the pure virtual method
  virtual G4double GetMeanFreePath(const G4Track& track,
                                   G4double previousStepSize,
                                   G4ForceCondition* condition) override;

  // implementation of the pure virtual method
  virtual G4double GetContinuousStepLimit(const G4Track& track,
                                          G4double previousStepSize,
                                          G4double currentMinimumStep,
                                          G4double& currentSafety) override;

  //------------------------------------------------------------------------
  // Run time method which may be also used by derived processes
  //------------------------------------------------------------------------

  // creeation of an empty vector for cross section
  G4PhysicsVector* LambdaPhysicsVector(const G4MaterialCutsCouple*, 
                                       G4double cut);

  inline size_t CurrentMaterialCutsCoupleIndex() const;

  //------------------------------------------------------------------------
  // Specific methods to set, access, modify models
  //------------------------------------------------------------------------

  // Select model in run time
  inline void SelectModel(G4double kinEnergy);

public:
  // Select model by energy and region index
  inline G4VEmModel* SelectModelForMaterial(G4double kinEnergy, 
                                            size_t& idx) const;

  // Add EM model coupled with fluctuation model for region, smaller value 
  // of order defines which pair of models will be selected for a given 
  // energy interval  
  void AddEmModel(G4int, G4VEmModel*, 
                  G4VEmFluctuationModel* fluc = 0,
                  const G4Region* region = nullptr);

  // Define new energy range for the model identified by the name
  void UpdateEmModel(const G4String&, G4double, G4double);

  // Assign a model to a process local list, to enable the list in run time 
  // the derived process should execute AddEmModel(..) for all such models
  void SetEmModel(G4VEmModel*, G4int index=0);
  
  // return a model from the local list
  G4VEmModel* EmModel(size_t index=0) const;
  
  // Access to models
  G4VEmModel* GetModelByIndex(G4int idx = 0, G4bool ver = false) const;

  G4int NumberOfModels() const;

  // Assign a fluctuation model to a process
  inline void SetFluctModel(G4VEmFluctuationModel*);
  
  // return the assigned fluctuation model
  inline G4VEmFluctuationModel* FluctModel();
    
  //------------------------------------------------------------------------
  // Define and access particle type 
  //------------------------------------------------------------------------

protected:
  inline void SetParticle(const G4ParticleDefinition* p);
  inline void SetSecondaryParticle(const G4ParticleDefinition* p);

public:
  inline void SetBaseParticle(const G4ParticleDefinition* p);
  inline const G4ParticleDefinition* Particle() const;
  inline const G4ParticleDefinition* BaseParticle() const;
  inline const G4ParticleDefinition* SecondaryParticle() const;

  //------------------------------------------------------------------------
  // Get/set parameters to configure the process at initialisation time
  //------------------------------------------------------------------------

  // Add subcutoff option for the region
  void ActivateSubCutoff(G4bool val, const G4Region* region = nullptr);

  // Activate biasing
  void SetCrossSectionBiasingFactor(G4double f, G4bool flag = true);

  void ActivateForcedInteraction(G4double length, 
                                 const G4String& region,
                                 G4bool flag = true);

  void ActivateSecondaryBiasing(const G4String& region, G4double factor,
                                G4double energyLimit);

  // Add subcutoff process (bremsstrahlung) to sample secondary 
  // particle production in vicinity of the geometry boundary
  void AddCollaborativeProcess(G4VEnergyLossProcess*);

  inline void SetLossFluctuations(G4bool val);

  inline void SetIntegral(G4bool val);
  inline G4bool IsIntegral() const;

  // Set/Get flag "isIonisation"
  void SetIonisation(G4bool val);
  inline G4bool IsIonisationProcess() const;

  // Redefine parameteters for stepping control
  void SetLinearLossLimit(G4double val);
  void SetStepFunction(G4double v1, G4double v2, G4bool lock=true);
  void SetLowestEnergyLimit(G4double);

  inline G4int NumberOfSubCutoffRegions() const;

  //------------------------------------------------------------------------
  // Specific methods to path Physics Tables to the process
  //------------------------------------------------------------------------

  void SetDEDXTable(G4PhysicsTable* p, G4EmTableType tType);
  void SetCSDARangeTable(G4PhysicsTable* pRange);
  void SetRangeTableForLoss(G4PhysicsTable* p);
  void SetSecondaryRangeTable(G4PhysicsTable* p);
  void SetInverseRangeTable(G4PhysicsTable* p);

  void SetLambdaTable(G4PhysicsTable* p);
  void SetSubLambdaTable(G4PhysicsTable* p);

  // Binning for dEdx, range, inverse range and labda tables
  void SetDEDXBinning(G4int nbins);

  // Min kinetic energy for tables
  void SetMinKinEnergy(G4double e);
  inline G4double MinKinEnergy() const;

  // Max kinetic energy for tables
  void SetMaxKinEnergy(G4double e);
  inline G4double MaxKinEnergy() const;

  // Biasing parameters
  inline G4double CrossSectionBiasingFactor() const;

  // Return values for given G4MaterialCutsCouple
  inline G4double GetDEDX(G4double& kineticEnergy, 
                          const G4MaterialCutsCouple*);
  inline G4double GetDEDXForSubsec(G4double& kineticEnergy, 
                                   const G4MaterialCutsCouple*);
  inline G4double GetRange(G4double& kineticEnergy, 
                           const G4MaterialCutsCouple*);
  inline G4double GetCSDARange(G4double& kineticEnergy, 
                               const G4MaterialCutsCouple*);
  inline G4double GetRangeForLoss(G4double& kineticEnergy, 
                                  const G4MaterialCutsCouple*);
  inline G4double GetKineticEnergy(G4double& range, 
                                   const G4MaterialCutsCouple*);
  inline G4double GetLambda(G4double& kineticEnergy, 
                            const G4MaterialCutsCouple*);

  inline G4bool TablesAreBuilt() const;

  // Access to specific tables
  inline G4PhysicsTable* DEDXTable() const;
  inline G4PhysicsTable* DEDXTableForSubsec() const;
  inline G4PhysicsTable* DEDXunRestrictedTable() const;
  inline G4PhysicsTable* IonisationTable() const;
  inline G4PhysicsTable* IonisationTableForSubsec() const;
  inline G4PhysicsTable* CSDARangeTable() const;
  inline G4PhysicsTable* SecondaryRangeTable() const;
  inline G4PhysicsTable* RangeTableForLoss() const;
  inline G4PhysicsTable* InverseRangeTable() const;
  inline G4PhysicsTable* LambdaTable() const;
  inline G4PhysicsTable* SubLambdaTable() const;

  //------------------------------------------------------------------------
  // Run time method for simulation of ionisation
  //------------------------------------------------------------------------

  // access atom on which interaction happens
  const G4Element* GetCurrentElement() const;

  // Set scaling parameters for ions is needed to G4EmCalculator
  inline void SetDynamicMassCharge(G4double massratio, G4double charge2ratio);

private:

  void FillSecondariesAlongStep(G4double& eloss, G4double& weight);

  void PrintWarning(G4String, G4double val);

  // define material and indexes
  inline void DefineMaterial(const G4MaterialCutsCouple* couple);

  //------------------------------------------------------------------------
  // Compute values using scaling relation, mass and charge of based particle
  //------------------------------------------------------------------------

  inline G4double GetDEDXForScaledEnergy(G4double scaledKinEnergy);
  inline G4double GetSubDEDXForScaledEnergy(G4double scaledKinEnergy);
  inline G4double GetIonisationForScaledEnergy(G4double scaledKinEnergy);
  inline G4double GetSubIonisationForScaledEnergy(G4double scaledKinEnergy);
  inline G4double GetScaledRangeForScaledEnergy(G4double scaledKinEnergy);
  inline G4double GetLimitScaledRangeForScaledEnergy(G4double scaledKinEnergy);
  inline G4double ScaledKinEnergyForLoss(G4double range);
  inline G4double GetLambdaForScaledEnergy(G4double scaledKinEnergy);
  inline void ComputeLambdaForScaledEnergy(G4double scaledKinEnergy);

  // hide  assignment operator
  G4VEnergyLossProcess(G4VEnergyLossProcess &) = delete;
  G4VEnergyLossProcess & operator=(const G4VEnergyLossProcess &right) = delete;
```


<!-- G4VEnergyLossProcess.md ends here -->
