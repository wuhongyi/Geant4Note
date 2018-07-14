<!-- G4KleinNishinaCompton.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 12:24:11 2018 (+0800)
;; Last-Updated: 六 7月 14 12:25:18 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4KleinNishinaCompton

**public G4VEmModel**

Implementation of gamma Compton scatteribg on free electron

## class

```cpp
public:

  explicit G4KleinNishinaCompton(const G4ParticleDefinition* p = nullptr, 
				 const G4String& nam = "Klein-Nishina");

  virtual ~G4KleinNishinaCompton();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual void InitialiseLocal(const G4ParticleDefinition*, 
			       G4VEmModel* masterModel) override;

  virtual G4double ComputeCrossSectionPerAtom(
                                const G4ParticleDefinition*,
                                      G4double kinEnergy, 
                                      G4double Z, 
                                      G4double A, 
                                      G4double cut,
                                      G4double emax) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;



private:

  // hide assignment operator
  G4KleinNishinaCompton & operator=
  (const G4KleinNishinaCompton &right) = delete;
  G4KleinNishinaCompton(const  G4KleinNishinaCompton&) = delete;
```

<!-- G4KleinNishinaCompton.md ends here -->
