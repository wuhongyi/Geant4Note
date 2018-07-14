<!-- G4LivermoreRayleighModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 05:05:30 2018 (+0800)
;; Last-Updated: 日 7月 15 05:06:11 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4LivermoreRayleighModel

**public G4VEmModel**


## class

```cpp
public:

  G4LivermoreRayleighModel();

  virtual ~G4LivermoreRayleighModel();

  virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&);

  virtual void InitialiseLocal(const G4ParticleDefinition*, 
			       G4VEmModel* masterModel);

  virtual void InitialiseForElement(const G4ParticleDefinition*, G4int Z);

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

  inline void SetLowEnergyThreshold(G4double);

private:

  void ReadData(size_t Z, const char* path = 0);

  G4LivermoreRayleighModel & operator=(const G4LivermoreRayleighModel &right);
  G4LivermoreRayleighModel(const G4LivermoreRayleighModel&);
```

<!-- G4LivermoreRayleighModel.md ends here -->
