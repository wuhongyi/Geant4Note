<!-- G4VMultipleScattering.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 06:48:09 2018 (+0800)
;; Last-Updated: 日 7月 15 06:50:53 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VMultipleScattering

**public G4VContinuousDiscreteProcess**

It is the generic process of multiple scattering it includes common part of calculations for all charged particles

## class

```cpp
public:

  G4VMultipleScattering(const G4String& name = "msc",
                        G4ProcessType type = fElectromagnetic);

  virtual ~G4VMultipleScattering();

  //------------------------------------------------------------------------
  // Virtual methods to be implemented for the concrete model
  //------------------------------------------------------------------------

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) override = 0;

  // obsolete
  virtual void PrintInfo() {};

  virtual void ProcessDescription(std::ostream& outFile) const override;

protected:

  virtual void InitialiseProcess(const G4ParticleDefinition*) = 0;

  virtual void StreamProcessInfo(std::ostream&, G4String) const {};

public:

  //------------------------------------------------------------------------
  // Generic methods common to all ContinuousDiscrete processes
  //------------------------------------------------------------------------

  // Initialise for build of tables
  void PreparePhysicsTable(const G4ParticleDefinition&) override;

  // Build physics table during initialisation
  void BuildPhysicsTable(const G4ParticleDefinition&) override;

  // Store PhysicsTable in a file.
  // Return false in case of failure at I/O
  G4bool StorePhysicsTable(const G4ParticleDefinition*,
                           const G4String& directory,
                           G4bool ascii = false) override;

  // Retrieve Physics from a file.
  // (return true if the Physics Table can be build by using file)
  // (return false if the process has no functionality or in case of failure)
  // File name should is constructed as processName+particleName and the
  // should be placed under the directory specifed by the argument.
  G4bool RetrievePhysicsTable(const G4ParticleDefinition*,
                              const G4String& directory,
                              G4bool ascii) override;

  // This is called in the beginning of tracking for a new track
  void StartTracking(G4Track*) override;

  // The function overloads the corresponding function of the base
  // class.It limits the step near to boundaries only
  // and invokes the method GetMscContinuousStepLimit at every step.
  G4double AlongStepGetPhysicalInteractionLength(
                                        const G4Track&,
                                        G4double  previousStepSize,
                                        G4double  currentMinimalStep,
                                        G4double& currentSafety,
                                        G4GPILSelection* selection) override;

  // The function overloads the corresponding function of the base
  // class.
  G4double PostStepGetPhysicalInteractionLength(
                                      const G4Track&,
                                      G4double  previousStepSize,
                                      G4ForceCondition* condition) override;

  // Along step actions
  G4VParticleChange* AlongStepDoIt(const G4Track&, const G4Step&) override;

  // Post step actions
  G4VParticleChange* PostStepDoIt(const G4Track&, const G4Step&) override;

  // This method does not used for tracking, it is intended only for tests
  G4double ContinuousStepLimit(const G4Track& track,
                               G4double previousStepSize,
                               G4double currentMinimalStep,
                               G4double& currentSafety);

  //------------------------------------------------------------------------
  // Specific methods to set, access, modify models
  //------------------------------------------------------------------------

  // Select model in run time
  inline G4VEmModel* SelectModel(G4double kinEnergy, size_t idx);

public:

  // Add model for region, smaller value of order defines which
  // model will be selected for a given energy interval  
  void AddEmModel(G4int order, G4VEmModel*, const G4Region* region = nullptr);

  // Assign a model to a process local list, to enable the list in run time 
  // the derived process should execute AddEmModel(..) for all such models
  void SetEmModel(G4VMscModel*, size_t index = 0);
  
  // return a model from the local list
  G4VMscModel* EmModel(size_t index = 0) const;

  // Access to run time models by index
  inline G4VEmModel* GetModelByIndex(G4int idx = 0, G4bool ver = false) const;

  //------------------------------------------------------------------------
  // Get/Set parameters for simulation of multiple scattering
  //------------------------------------------------------------------------

  void SetIonisation(G4VEnergyLossProcess*);
  
  inline G4bool LateralDisplasmentFlag() const;
  inline void SetLateralDisplasmentFlag(G4bool val);

  inline G4double Skin() const;
  inline void SetSkin(G4double val);
  
  inline G4double RangeFactor() const;
  inline void SetRangeFactor(G4double val);
  
  inline G4double GeomFactor() const;
 
  inline G4double PolarAngleLimit() const;
 
  inline G4MscStepLimitType StepLimitType() const;
  inline void SetStepLimitType(G4MscStepLimitType val);

  inline G4double LowestKinEnergy() const;
  inline void SetLowestKinEnergy(G4double val);

  inline const G4ParticleDefinition* FirstParticle() const;

  //------------------------------------------------------------------------
  // Run time methods
  //------------------------------------------------------------------------

protected:

  // This method is not used for tracking, it returns mean free path value
  G4double GetMeanFreePath(const G4Track& track,
                           G4double,
                           G4ForceCondition* condition) override;

  // This method is not used for tracking, it returns step limit
  G4double GetContinuousStepLimit(const G4Track& track,
                                  G4double previousStepSize,
                                  G4double currentMinimalStep,
                                  G4double& currentSafety) override ;

  // return number of already added models
  inline G4int NumberOfModels() const;

private:

  // hide  assignment operator
  G4VMultipleScattering(G4VMultipleScattering &) = delete;
  G4VMultipleScattering & 
    operator=(const G4VMultipleScattering &right) = delete;

  // Print out of generic class parameters
  void StreamInfo(std::ostream& outFile, const G4ParticleDefinition&,
                  G4String endOfLine=G4String("\n")) const;
```

<!-- G4VMultipleScattering.md ends here -->
