<!-- G4VEmModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 四 7月 12 22:27:09 2018 (+0800)
;; Last-Updated: 四 7月 12 22:30:41 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VEmModel

Abstract interface to energy loss models






## class

```cpp
public:

  explicit G4VEmModel(const G4String& nam);

  virtual ~G4VEmModel();

  //------------------------------------------------------------------------
  // Virtual methods to be implemented for any concrete model
  //------------------------------------------------------------------------

  virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&) = 0;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
                                 const G4MaterialCutsCouple*,
                                 const G4DynamicParticle*,
                                 G4double tmin = 0.0,
                                 G4double tmax = DBL_MAX) = 0;

  //------------------------------------------------------------------------
  // Methods for initialisation of MT; may be overwritten if needed
  //------------------------------------------------------------------------

  // initilisation in local thread
  virtual void InitialiseLocal(const G4ParticleDefinition*,
                               G4VEmModel* masterModel);

  // initilisation of a new material at run time
  virtual void InitialiseForMaterial(const G4ParticleDefinition*,
                                     const G4Material*);

  // initilisation of a new element at run time
  virtual void InitialiseForElement(const G4ParticleDefinition*,
                                    G4int Z);

  //------------------------------------------------------------------------
  // Methods with standard implementation; may be overwritten if needed 
  //------------------------------------------------------------------------

  // main method to compute dEdx
  virtual G4double ComputeDEDXPerVolume(const G4Material*,
                                        const G4ParticleDefinition*,
                                        G4double kineticEnergy,
                                        G4double cutEnergy = DBL_MAX);

  // main method to compute cross section per Volume
  virtual G4double CrossSectionPerVolume(const G4Material*,
                                         const G4ParticleDefinition*,
                                         G4double kineticEnergy,
                                         G4double cutEnergy = 0.0,
                                         G4double maxEnergy = DBL_MAX);

  // method to get partial cross section
  virtual G4double GetPartialCrossSection(const G4Material*,
                                          G4int level,
                                          const G4ParticleDefinition*,
                                          G4double kineticEnergy);

  // main method to compute cross section per atom
  virtual G4double ComputeCrossSectionPerAtom(const G4ParticleDefinition*,
                                              G4double kinEnergy,
                                              G4double Z,
                                              G4double A = 0., /* amu */
                                              G4double cutEnergy = 0.0,
                                              G4double maxEnergy = DBL_MAX);

  // main method to compute cross section per atomic shell
  virtual G4double ComputeCrossSectionPerShell(const G4ParticleDefinition*,
                                               G4int Z, G4int shellIdx,
                                               G4double kinEnergy,
                                               G4double cutEnergy = 0.0,
                                               G4double maxEnergy = DBL_MAX);

  // Compute effective ion charge square
  virtual G4double ChargeSquareRatio(const G4Track&);

  // Compute effective ion charge square
  virtual G4double GetChargeSquareRatio(const G4ParticleDefinition*,
                                        const G4Material*,
                                        G4double kineticEnergy);

  // Compute ion charge 
  virtual G4double GetParticleCharge(const G4ParticleDefinition*,
                                     const G4Material*,
                                     G4double kineticEnergy);

  // Initialisation for a new track
  virtual void StartTracking(G4Track*);

  // add correction to energy loss and compute non-ionizing energy loss
  virtual void CorrectionsAlongStep(const G4MaterialCutsCouple*,
                                    const G4DynamicParticle*,
                                    G4double& eloss,
                                    G4double& niel,
                                    G4double length);

  // value which may be tabulated (by default cross section)
  virtual G4double Value(const G4MaterialCutsCouple*,
                         const G4ParticleDefinition*,
                         G4double kineticEnergy);

  // threshold for zero value 
  virtual G4double MinPrimaryEnergy(const G4Material*,
                                    const G4ParticleDefinition*,
                                    G4double cut = 0.0);

  // model can define low-energy limit for the cut
  virtual G4double MinEnergyCut(const G4ParticleDefinition*,
                                const G4MaterialCutsCouple*);

  // initilisation at run time for a given material
  virtual void SetupForMaterial(const G4ParticleDefinition*,
                                const G4Material*,
                                G4double kineticEnergy);

  // add a region for the model
  virtual void DefineForRegion(const G4Region*);

  // for automatic documentation
  virtual void ModelDescription(std::ostream& outFile) const;
  
  virtual void ModelDescription(std::ostream& outFile,
                                G4String endOfLine) const; 






public:

  //------------------------------------------------------------------------
  // Generic methods common to all models
  //------------------------------------------------------------------------

  // should be called at initialisation to build element selectors
  void InitialiseElementSelectors(const G4ParticleDefinition*,
                                  const G4DataVector&);

  // should be called at initialisation to access element selectors
  inline std::vector<G4EmElementSelector*>* GetElementSelectors();

  // should be called at initialisation to set element selectors
  inline void SetElementSelectors(std::vector<G4EmElementSelector*>*);

  // dEdx per unit length
  virtual inline G4double ComputeDEDX(const G4MaterialCutsCouple*,
                              const G4ParticleDefinition*,
                              G4double kineticEnergy,
                              G4double cutEnergy = DBL_MAX);

  // cross section per volume
  inline G4double CrossSection(const G4MaterialCutsCouple*,
                               const G4ParticleDefinition*,
                               G4double kineticEnergy,
                               G4double cutEnergy = 0.0,
                               G4double maxEnergy = DBL_MAX);

  // compute mean free path via cross section per volume
  inline G4double ComputeMeanFreePath(const G4ParticleDefinition*,
                                      G4double kineticEnergy,
                                      const G4Material*,
                                      G4double cutEnergy = 0.0,
                                      G4double maxEnergy = DBL_MAX);

  // generic cross section per element
  inline G4double ComputeCrossSectionPerAtom(const G4ParticleDefinition*,
                                             const G4Element*,
                                             G4double kinEnergy,
                                             G4double cutEnergy = 0.0,
                                             G4double maxEnergy = DBL_MAX);

  // select isotope in order to have precise mass of the nucleus
  inline G4int SelectIsotopeNumber(const G4Element*);

  // atom can be selected effitiantly if element selectors are initialised 
  inline const G4Element* SelectRandomAtom(const G4MaterialCutsCouple*,
                                           const G4ParticleDefinition*,
                                           G4double kineticEnergy,
                                           G4double cutEnergy = 0.0,
                                           G4double maxEnergy = DBL_MAX);

  // to select atom cross section per volume is recomputed for each element 
  const G4Element* SelectRandomAtom(const G4Material*,
                                    const G4ParticleDefinition*,
                                    G4double kineticEnergy,
                                    G4double cutEnergy = 0.0,
                                    G4double maxEnergy = DBL_MAX);

  // to select atom if cross section is proportional number of electrons 
  inline G4int SelectRandomAtomNumber(const G4Material*);

  //------------------------------------------------------------------------
  // Get/Set methods
  //------------------------------------------------------------------------

  void SetParticleChange(G4VParticleChange*, G4VEmFluctuationModel* f=nullptr);

  void SetCrossSectionTable(G4PhysicsTable*, G4bool isLocal);

  inline G4ElementData* GetElementData();

  inline G4PhysicsTable* GetCrossSectionTable();

  inline G4VEmFluctuationModel* GetModelOfFluctuations();

  inline G4VEmAngularDistribution* GetAngularDistribution();

  inline G4VEmModel* GetTripletModel();

  inline void SetTripletModel(G4VEmModel*);

  inline void SetAngularDistribution(G4VEmAngularDistribution*);

  inline G4double HighEnergyLimit() const;

  inline G4double LowEnergyLimit() const;

  inline G4double HighEnergyActivationLimit() const;

  inline G4double LowEnergyActivationLimit() const;

  inline G4double PolarAngleLimit() const;

  inline G4double SecondaryThreshold() const;

  inline G4bool LPMFlag() const;

  inline G4bool DeexcitationFlag() const;

  inline G4bool ForceBuildTableFlag() const;

  inline G4bool UseAngularGeneratorFlag() const;

  inline void SetAngularGeneratorFlag(G4bool);

  inline void SetHighEnergyLimit(G4double);

  inline void SetLowEnergyLimit(G4double);

  inline void SetActivationHighEnergyLimit(G4double);

  inline void SetActivationLowEnergyLimit(G4double);

  inline G4bool IsActive(G4double kinEnergy);

  inline void SetPolarAngleLimit(G4double);

  inline void SetSecondaryThreshold(G4double);

  inline void SetLPMFlag(G4bool val);

  inline void SetDeexcitationFlag(G4bool val);

  inline void SetForceBuildTable(G4bool val);

  inline void SetFluctuationFlag(G4bool val);

  inline void SetMasterThread(G4bool val);

  inline G4bool IsMaster() const;

  inline G4double MaxSecondaryKinEnergy(const G4DynamicParticle* dynParticle);

  inline const G4String& GetName() const;

  inline void SetCurrentCouple(const G4MaterialCutsCouple*);

  inline const G4Element* GetCurrentElement() const;

  inline const G4Isotope* GetCurrentIsotope() const;

  inline G4bool IsLocked() const;

  inline void SetLocked(G4bool);










```

<!-- G4VEmModel.md ends here -->
