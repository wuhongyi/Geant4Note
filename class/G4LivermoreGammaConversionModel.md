<!-- G4LivermoreGammaConversionModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 05:57:17 2018 (+0800)
;; Last-Updated: 日 7月 15 05:58:59 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4LivermoreGammaConversionModel

**public G4VEmModel**

- "/livermore/pair/pp-cs-x.dat"

## class

```cpp
public:

  explicit G4LivermoreGammaConversionModel(
                      const G4ParticleDefinition* p = nullptr, 
		      const G4String& nam = "LivermoreConversion");

  virtual ~G4LivermoreGammaConversionModel();

  virtual void Initialise(const G4ParticleDefinition*, 
                          const G4DataVector&);

  virtual void InitialiseLocal(const G4ParticleDefinition*, 
			             G4VEmModel* masterModel);

  virtual void InitialiseForElement(const G4ParticleDefinition*, G4int Z);

  virtual G4double ComputeCrossSectionPerAtom(
                                const G4ParticleDefinition*,
                                      G4double kinEnergy, 
                                      G4double Z, 
                                      G4double A=0.0, 
                                      G4double cut=0.0,
                                      G4double emax=DBL_MAX);

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				       G4double tmin,
				       G4double maxEnergy);

  virtual G4double MinPrimaryEnergy(const G4Material*,
				    const G4ParticleDefinition*,
				    G4double);

private:

  void ReadData(size_t Z, const char* path = nullptr);
  void InitialiseProbability(const G4ParticleDefinition*, G4int Z);

  inline G4double ScreenFunction1(G4double screenVariable);
  inline G4double ScreenFunction2(G4double screenVariable);

  G4LivermoreGammaConversionModel & operator=
  (const  G4LivermoreGammaConversionModel &right) = delete;
  G4LivermoreGammaConversionModel(const  G4LivermoreGammaConversionModel&) = delete;
```

<!-- G4LivermoreGammaConversionModel.md ends here -->
