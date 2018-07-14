<!-- G4BetheHeitlerModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 04:58:27 2018 (+0800)
;; Last-Updated: 日 7月 15 04:59:18 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4BetheHeitlerModel

**public G4VEmModel**

Implementation of gamma convertion to e+e- in the field of a nucleus 

## class

```cpp
public:

  explicit G4BetheHeitlerModel(const G4ParticleDefinition* p = 0, 
			       const G4String& nam = "BetheHeitler");
 
  virtual ~G4BetheHeitlerModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual void InitialiseLocal(const G4ParticleDefinition*, 
			       G4VEmModel* masterModel) override;

  virtual G4double ComputeCrossSectionPerAtom(
                                const G4ParticleDefinition*,
                                      G4double kinEnergy, 
                                      G4double Z, 
                                      G4double A=0., 
                                      G4double cut=0.,
                                      G4double emax=DBL_MAX) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;

private:

  G4double ScreenFunction1(G4double ScreenVariable);

  G4double ScreenFunction2(G4double ScreenVariable);

  // hide assignment operator
  G4BetheHeitlerModel & operator=(const G4BetheHeitlerModel &right) = delete;
  G4BetheHeitlerModel(const  G4BetheHeitlerModel&) = delete;
```

<!-- G4BetheHeitlerModel.md ends here -->
