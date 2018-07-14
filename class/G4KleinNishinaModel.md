<!-- G4KleinNishinaModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 12:28:43 2018 (+0800)
;; Last-Updated: 六 7月 14 12:29:54 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4KleinNishinaModel

**public G4VEmModel**

Implementation of gamma Compton scattering with atomic effects 

## class

```cpp
public:

  explicit G4KleinNishinaModel(const G4String& nam = "KleinNishina");

  virtual ~G4KleinNishinaModel();

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
  G4KleinNishinaModel & operator=(const  G4KleinNishinaModel &right) = delete;
  G4KleinNishinaModel(const  G4KleinNishinaModel&) = delete;
```

<!-- G4KleinNishinaModel.md ends here -->
