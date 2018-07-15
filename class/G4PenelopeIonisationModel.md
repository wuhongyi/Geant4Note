<!-- G4PenelopeIonisationModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 07:26:19 2018 (+0800)
;; Last-Updated: 日 7月 15 07:27:18 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4PenelopeIonisationModel

**public G4VEmModel**

Low Energy Electromagnetic Physics, e+ and e- ionisation with Penelope Model, version 2008

## class

```cpp
public:
  
  G4PenelopeIonisationModel(const G4ParticleDefinition* p=0,
			    const G4String& processName ="PenIoni");
  
  virtual ~G4PenelopeIonisationModel();

  virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&);
  virtual void InitialiseLocal(const G4ParticleDefinition*,
			       G4VEmModel*);

  //*This is a dummy method. Never inkoved by the tracking, it just issues 
  //*a warning if one tries to get Cross Sections per Atom via the 
  //*G4EmCalculator.
  virtual G4double ComputeCrossSectionPerAtom(const G4ParticleDefinition*,
                                              G4double,
                                              G4double,
                                              G4double,
                                              G4double,
                                              G4double);

  virtual G4double CrossSectionPerVolume(const G4Material* material,
                                         const G4ParticleDefinition* 
					 theParticle,
                                         G4double kineticEnergy,
                                         G4double cutEnergy,
                                         G4double maxEnergy = DBL_MAX);
					 
  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy);
				   
  virtual G4double ComputeDEDXPerVolume(const G4Material*,
                               const G4ParticleDefinition*,
                               G4double kineticEnergy,
                               G4double cutEnergy);

  // Min cut in kinetic energy allowed by the model
  virtual G4double MinEnergyCut(const G4ParticleDefinition*,
                                const G4MaterialCutsCouple*);		

  void SetVerbosityLevel(G4int lev){verboseLevel = lev;};
  G4int GetVerbosityLevel(){return verboseLevel;};

protected:
  G4ParticleChangeForLoss* fParticleChange;
  const G4ParticleDefinition* fParticle;

private:
 
  G4PenelopeIonisationModel & operator=(const G4PenelopeIonisationModel &right);
  G4PenelopeIonisationModel(const G4PenelopeIonisationModel&);

  void SetParticle(const G4ParticleDefinition*);

  void SampleFinalStateElectron(const G4Material*,
				G4double cutEnergy,
				G4double kineticEnergy);
  void SampleFinalStatePositron(const G4Material*,
				G4double cutEnergy,
				G4double kineticEnergy);
```

<!-- G4PenelopeIonisationModel.md ends here -->
