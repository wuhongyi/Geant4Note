<!-- G4VEmProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 11:42:25 2018 (+0800)
;; Last-Updated: 六 7月 14 11:47:32 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VEmProcess

**public G4VDiscreteProcess**

It is the unified Discrete process

## class

```cpp
public:

  G4VEmProcess(const G4String& name,
               G4ProcessType type = fElectromagnetic);

  virtual ~G4VEmProcess();

  //------------------------------------------------------------------------
  // Virtual methods to be implemented in concrete processes
  //------------------------------------------------------------------------

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) override = 0;

  // obsolete
  virtual void PrintInfo() {};

  virtual void ProcessDescription(std::ostream& outFile) const override;

protected:

  virtual void StreamProcessInfo(std::ostream&, G4String) const {};

  virtual void InitialiseProcess(const G4ParticleDefinition*) = 0;

  //------------------------------------------------------------------------
  // Method with standard implementation; may be overwritten if needed
  //------------------------------------------------------------------------

  virtual G4double MinPrimaryEnergy(const G4ParticleDefinition*,
                                    const G4Material*);

  //------------------------------------------------------------------------
  // Implementation of virtual methods common to all Discrete processes 
  //------------------------------------------------------------------------

public:

  // Initialise for build of tables
  virtual void PreparePhysicsTable(const G4ParticleDefinition&) override;

  // Build physics table during initialisation
  virtual void BuildPhysicsTable(const G4ParticleDefinition&) override;

  // Called before tracking of each new G4Track
  virtual void StartTracking(G4Track*) override;

  // implementation of virtual method, specific for G4VEmProcess
  virtual G4double PostStepGetPhysicalInteractionLength(
                             const G4Track& track,
                             G4double   previousStepSize,
                             G4ForceCondition* condition) override;

  // implementation of virtual method, specific for G4VEmProcess
  virtual G4VParticleChange* PostStepDoIt(const G4Track&, 
                                          const G4Step&) override;

  // Store PhysicsTable in a file.
  // Return false in case of failure at I/O
  virtual G4bool StorePhysicsTable(const G4ParticleDefinition*,
                                   const G4String& directory,
                                   G4bool ascii = false) override;

  // Retrieve Physics from a file.
  // (return true if the Physics Table can be build by using file)
  // (return false if the process has no functionality or in case of failure)
  // File name should is constructed as processName+particleName and the
  // should be placed under the directory specifed by the argument.
  virtual G4bool RetrievePhysicsTable(const G4ParticleDefinition*,
                                      const G4String& directory,
                                      G4bool ascii) override;

  //------------------------------------------------------------------------
  // Specific methods for Discrete EM post step simulation 
  //------------------------------------------------------------------------

  // It returns the cross section per volume for energy/ material
  G4double CrossSectionPerVolume(G4double kineticEnergy,
                                 const G4MaterialCutsCouple* couple);

  // It returns the cross section of the process per atom
  G4double ComputeCrossSectionPerAtom(G4double kineticEnergy, 
                                      G4double Z, G4double A=0., 
                                      G4double cut=0.0);

  G4double MeanFreePath(const G4Track& track);

  // It returns cross section per volume
  inline G4double GetLambda(G4double& kinEnergy, 
                            const G4MaterialCutsCouple* couple);

  //------------------------------------------------------------------------
  // Specific methods to build and access Physics Tables
  //------------------------------------------------------------------------

  // Binning for lambda table
  void SetLambdaBinning(G4int nbins);

  // Min kinetic energy for tables
  void SetMinKinEnergy(G4double e);

  // Min kinetic energy for high energy table
  void SetMinKinEnergyPrim(G4double e);

  // Max kinetic energy for tables
  void SetMaxKinEnergy(G4double e);

  // Cross section table pointers
  inline G4PhysicsTable* LambdaTable() const;
  inline G4PhysicsTable* LambdaTablePrim() const;

  //------------------------------------------------------------------------
  // Define and access particle type 
  //------------------------------------------------------------------------

  inline const G4ParticleDefinition* Particle() const;
  inline const G4ParticleDefinition* SecondaryParticle() const;

  //------------------------------------------------------------------------
  // Specific methods to set, access, modify models and basic parameters
  //------------------------------------------------------------------------

protected:
  // Select model in run time
  inline G4VEmModel* SelectModel(G4double& kinEnergy, size_t index); 

public:
  // Select model by energy and region index
  inline G4VEmModel* SelectModelForMaterial(G4double kinEnergy, 
                                            size_t& idxRegion) const;
   
  // Add model for region, smaller value of order defines which
  // model will be selected for a given energy interval  
  void AddEmModel(G4int, G4VEmModel*, const G4Region* region = nullptr);

  // Assign a model to a process local list, to enable the list in run time 
  // the derived process should execute AddEmModel(..) for all such models
  void SetEmModel(G4VEmModel*, G4int index = 0);
      
  // return a model from the local list
  G4VEmModel* EmModel(size_t index = 0) const;

  // Define new energy range for the model identified by the name
  void UpdateEmModel(const G4String&, G4double, G4double);

  // Access to models
  G4int GetNumberOfModels() const;
  G4int GetNumberOfRegionModels(size_t couple_index) const;
  G4VEmModel* GetRegionModel(G4int idx, size_t couple_index) const;
  G4VEmModel* GetModelByIndex(G4int idx = 0, G4bool ver = false) const;

  // Access to active model
  inline const G4VEmModel* GetCurrentModel() const;

  // Access to the current G4Element
  const G4Element* GetCurrentElement() const;

  // Biasing parameters
  void SetCrossSectionBiasingFactor(G4double f, G4bool flag = true);
  inline G4double CrossSectionBiasingFactor() const;

  // Activate forced interaction
  void ActivateForcedInteraction(G4double length = 0.0, 
                                 const G4String& r = "",
                                 G4bool flag = true);

  void ActivateSecondaryBiasing(const G4String& region, G4double factor,
          G4double energyLimit);
          
  inline void SetIntegral(G4bool val);

  inline void SetBuildTableFlag(G4bool val);

  //------------------------------------------------------------------------
  // Other generic methods
  //------------------------------------------------------------------------
  
protected:

  virtual G4double GetMeanFreePath(const G4Track& track,
                                   G4double previousStepSize,
                                   G4ForceCondition* condition) override;

  G4PhysicsVector* LambdaPhysicsVector(const G4MaterialCutsCouple*);

  inline G4int LambdaBinning() const;

  inline G4double MinKinEnergy() const;

  inline G4double MaxKinEnergy() const;

  // Single scattering parameters
  inline G4double PolarAngleLimit() const;

  inline G4bool IsIntegral() const;

  inline G4double RecalculateLambda(G4double kinEnergy,
                                     const G4MaterialCutsCouple* couple);

  inline G4ParticleChangeForGamma* GetParticleChange();

  inline void SetParticle(const G4ParticleDefinition* p);
  
  inline void SetSecondaryParticle(const G4ParticleDefinition* p);

  inline size_t CurrentMaterialCutsCoupleIndex() const;

  inline G4double GetGammaEnergyCut();

  inline G4double GetElectronEnergyCut();

  inline void SetStartFromNullFlag(G4bool val);

  inline void SetSplineFlag(G4bool val);

  inline const G4Element* GetTargetElement() const;

  inline const G4Isotope* GetTargetIsotope() const;

private:

  void Clear();

  void BuildLambdaTable();

  void StreamInfo(std::ostream& outFile, const G4ParticleDefinition&,
                  G4String endOfLine=G4String("\n")) const;

  void FindLambdaMax();

  void PrintWarning(G4String tit, G4double val);

  inline void DefineMaterial(const G4MaterialCutsCouple* couple);

  inline void ComputeIntegralLambda(G4double kinEnergy);

  inline G4double GetLambdaFromTable(G4double kinEnergy);

  inline G4double GetLambdaFromTablePrim(G4double kinEnergy);

  inline G4double GetCurrentLambda(G4double kinEnergy);

  inline G4double ComputeCurrentLambda(G4double kinEnergy);

  // hide copy constructor and assignment operator
  G4VEmProcess(G4VEmProcess &) = delete;
  G4VEmProcess & operator=(const G4VEmProcess &right) = delete;
```



<!-- G4VEmProcess.md ends here -->
