<!-- G4VAtomDeexcitation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 13:04:51 2018 (+0800)
;; Last-Updated: 六 9月  1 13:06:39 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VAtomDeexcitation

Abstract interface to energy loss models

## class

```cpp
public:

  explicit G4VAtomDeexcitation(const G4String& modname = "Deexcitation");

  virtual ~G4VAtomDeexcitation();

  //========== initialization ==========

  // Overall initialisation before new run
  void InitialiseAtomicDeexcitation();

  // Initialisation of deexcitation at the beginning of run 
  virtual void InitialiseForNewRun() = 0;

  // Initialisation for a concrete atom 
  // May be called at run time 
  virtual void InitialiseForExtraAtom(G4int Z) = 0;

  void SetDeexcitationActiveRegion(const G4String& rname, 
                                   G4bool valDeexcitation,
                                   G4bool valAuger,
                                   G4bool valPIXE);

  // Activation of deexcitation
  inline void SetFluo(G4bool);
  inline G4bool IsFluoActive() const;

  // Activation of Auger electron production
  inline void SetAuger(G4bool);
  inline G4bool IsAugerActive() const;

  // Activation of Auger cascade
  inline void SetAugerCascade(G4bool);
  inline G4bool IsAugerCascadeActive() const;

  // Activation of PIXE simulation
  inline void SetPIXE(G4bool);
  inline G4bool IsPIXEActive() const;

  // Deexcitation model name
  inline const G4String& GetName() const;

  // Access to the list of atoms active for deexcitation
  inline const std::vector<G4bool>& GetListOfActiveAtoms() const;

  // Verbosity level
  inline void SetVerboseLevel(G4int);
  inline G4int GetVerboseLevel() const;

  //========== Run time methods ==========

  // Check if deexcitation is active for a given geometry volume
  inline G4bool CheckDeexcitationActiveRegion(G4int coupleIndex);
  inline G4bool CheckAugerActiveRegion(G4int coupleIndex);

  // Get atomic shell by shell index, used by discrete processes 
  // (for example, photoelectric), when shell vacancy sampled by the model
  virtual 
  const G4AtomicShell* GetAtomicShell(G4int Z, 
                                      G4AtomicShellEnumerator shell) = 0;

  // generation of deexcitation for given atom and shell vacancy
  inline void GenerateParticles(std::vector<G4DynamicParticle*>* secVect,  
                                const G4AtomicShell*, 
                                G4int Z,
                                G4int coupleIndex);

  // generation of deexcitation for given atom and shell vacancy
  virtual void GenerateParticles(std::vector<G4DynamicParticle*>* secVect,  
                                 const G4AtomicShell*, 
                                 G4int Z,
                                 G4double gammaCut,
                                 G4double eCut) = 0;

  // access or compute PIXE cross section 
  virtual G4double 
  GetShellIonisationCrossSectionPerAtom(const G4ParticleDefinition*, 
                                        G4int Z, 
                                        G4AtomicShellEnumerator shell,
                                        G4double kinE,
                                        const G4Material* mat = nullptr) = 0;

  // access or compute PIXE cross section 
  virtual G4double 
  ComputeShellIonisationCrossSectionPerAtom(
                                        const G4ParticleDefinition*, 
                                        G4int Z, 
                                        G4AtomicShellEnumerator shell,
                                        G4double kinE,
                                        const G4Material* mat = nullptr) = 0;

  // Sampling of PIXE for ionisation processes
  void AlongStepDeexcitation(std::vector<G4Track*>& tracks,  
                             const G4Step& step, 
                             G4double& eLoss,
                             G4int coupleIndex);

private:

  // copy constructor and hide assignment operator
  G4VAtomDeexcitation(G4VAtomDeexcitation &) = delete;
  G4VAtomDeexcitation & operator=(const G4VAtomDeexcitation &right) = delete;

  G4EmParameters*             theParameters;  
  const G4ParticleDefinition* gamma;

  G4ProductionCutsTable* theCoupleTable;
  G4int    verbose;
  G4String name;

  G4bool   isActive;
  G4bool   flagAuger;
  G4bool   flagAugerCascade;
  G4bool   flagPIXE;
  G4bool   ignoreCuts;

  G4bool   isActiveLocked;
  G4bool   isAugerLocked;
  G4bool   isAugerCascadeLocked;
  G4bool   isPIXELocked;

  std::vector<G4bool>   activeZ;
  std::vector<G4bool>   activeDeexcitationMedia;
  std::vector<G4bool>   activeAugerMedia;
  std::vector<G4bool>   activePIXEMedia;
  std::vector<G4String> activeRegions;
  std::vector<G4bool>   deRegions;
  std::vector<G4bool>   AugerRegions;
  std::vector<G4bool>   PIXERegions;
  std::vector<G4DynamicParticle*> vdyn;

  static G4int pixeIDg;
  static G4int pixeIDe;
```


<!-- G4VAtomDeexcitation.md ends here -->
