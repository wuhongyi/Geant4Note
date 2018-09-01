<!-- G4PreCompoundModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:37:38 2018 (+0800)
;; Last-Updated: 六 9月  1 12:42:14 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4PreCompoundModel

**public G4VPreCompoundModel**

Model implementation for pre-equilibrium decay models in geant4. To be used in your physics list, in case you neeed this kind of physics. Can be used as a stand-allone model, but also in conjunction with an intra-nuclear transport, or any of the string-parton models.

- G4PreCompoundEmission
- G4VPreCompoundTransitions
	- G4GNASHTransitions
	- G4PreCompoundTransitions



## class

```cpp
public:

  explicit G4PreCompoundModel(G4ExcitationHandler* ptr = nullptr); 

  virtual ~G4PreCompoundModel();

  virtual G4HadFinalState * ApplyYourself(const G4HadProjectile & thePrimary, 
					  G4Nucleus & theNucleus) final;

  virtual G4ReactionProductVector* DeExcite(G4Fragment& aFragment) final;

  virtual void BuildPhysicsTable(const G4ParticleDefinition&) final;

  virtual void InitialiseModel() final;
  
  virtual void ModelDescription(std::ostream& outFile) const final;
  virtual void DeExciteModelDescription(std::ostream& outFile) const final;

  //====== obsolete Set methods =======
  void UseHETCEmission();
  void UseDefaultEmission();
  void UseGNASHTransition();
  void UseDefaultTransition();

  //for cross section selection
  void SetOPTxs(G4int opt);

  //for the rest of external choices
  void UseSICB();
  void UseNGB();
  void UseSCO();
  void UseCEMtr();
  //======================================

private:  

  inline 
  void PerformEquilibriumEmission(const G4Fragment & aFragment, 
				  G4ReactionProductVector * theResult) const;

  void PrintWarning(const G4String& mname);

  G4PreCompoundModel(const G4PreCompoundModel &) = delete;
  const G4PreCompoundModel& operator=(const G4PreCompoundModel &right) = delete;
  G4bool operator==(const G4PreCompoundModel &right) const = delete;
  G4bool operator!=(const G4PreCompoundModel &right) const = delete;

  //==============
  // Data Members 
  //==============

  G4PreCompoundEmission*     theEmission;
  G4VPreCompoundTransitions* theTransition;

  const G4ParticleDefinition* proton;
  const G4ParticleDefinition* neutron;

  G4double fLevelDensity;
  G4double fLimitEnergy;

  //for the rest of external choices
  G4bool useSCO;
  G4bool isInitialised;
  G4bool isActive;

  G4int  minZ;
  G4int  minA;

  G4HadFinalState theResult;
```

<!-- G4PreCompoundModel.md ends here -->
