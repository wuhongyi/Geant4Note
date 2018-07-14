<!-- G4PenelopeGammaConversionModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 04:52:35 2018 (+0800)
;; Last-Updated: 日 7月 15 04:57:16 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4PenelopeGammaConversionModel

**public G4VEmModel**

Low Energy Electromagnetic Physics, Gamma Conversion with Penelope Model, version 2008


- "/penelope/pairproduction/pdgpp" << Z << ".p08"
- "/penelope/pairproduction/pdgpp0" << Z << ".p08"



## class

```cpp
public:
  
  G4PenelopeGammaConversionModel(const G4ParticleDefinition* p=0,
				 const G4String& processName ="PenConversion");
  
  virtual ~G4PenelopeGammaConversionModel();

  virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&);
  virtual void InitialiseLocal(const G4ParticleDefinition*, G4VEmModel*); 
  virtual G4double ComputeCrossSectionPerAtom(
					      const G4ParticleDefinition*,
					      G4double kinEnergy,
					      G4double Z,
					      G4double A=0,
					      G4double cut=0,
					      G4double emax=DBL_MAX);

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy);

  void SetVerbosityLevel(G4int lev){verboseLevel = lev;};
  G4int GetVerbosityLevel(){return verboseLevel;};

protected:
  G4ParticleChangeForGamma* fParticleChange;
  const G4ParticleDefinition* fParticle;

private:
  G4PenelopeGammaConversionModel & operator=(const 
					       G4PenelopeGammaConversionModel &right);
  G4PenelopeGammaConversionModel(const G4PenelopeGammaConversionModel&);

  void SetParticle(const G4ParticleDefinition*);

  //Intrinsic energy limits of the model: cannot be extended by the parent process
  G4double fIntrinsicLowEnergyLimit;
  G4double fIntrinsicHighEnergyLimit;

  //Use a quicker sampling algorithm if E < smallEnergy
  G4double fSmallEnergy; 

  std::map<G4int,G4PhysicsFreeVector*> *logAtomicCrossSection;
  void ReadDataFile(const G4int Z);

  void InitializeScreeningRadii();
  G4double fAtomicScreeningRadius[99];

  void InitializeScreeningFunctions(const G4Material*);
  //Effective (scalar) properties attached to materials:
  // effective charge
  std::map<const G4Material*,G4double> *fEffectiveCharge;
  // 2/Rs (Rs = screening radius), BCB array in Penelope
  std::map<const G4Material*,G4double> *fMaterialInvScreeningRadius;
  // Parameters of screening functions
  std::map<const G4Material*,std::pair<G4double,G4double> > *fScreeningFunction;

  std::pair<G4double,G4double> GetScreeningFunctions(G4double);	
```




<!-- G4PenelopeGammaConversionModel.md ends here -->
