<!-- G4PEEffectFluoModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 12:50:10 2018 (+0800)
;; Last-Updated: 六 7月 14 12:51:01 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4PEEffectFluoModel

**public G4VEmModel**

Implementation of the photo-electric effect with deexcitation

## class

```cpp
public:

  explicit G4PEEffectFluoModel(const G4String& nam = "PhotoElectric");

  virtual ~G4PEEffectFluoModel();

  virtual 
  void Initialise(const G4ParticleDefinition*, const G4DataVector&) override;

  virtual 
  G4double ComputeCrossSectionPerAtom(const G4ParticleDefinition*,
				      G4double kinEnergy,
				      G4double Z,
				      G4double A,
				      G4double, G4double) override;
				      
  virtual G4double CrossSectionPerVolume(const G4Material*,
					 const G4ParticleDefinition*,
					 G4double kineticEnergy,
					 G4double cutEnergy,
					 G4double maxEnergy) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;
private:

  G4PEEffectFluoModel & operator=(const G4PEEffectFluoModel &right) = delete;
  G4PEEffectFluoModel(const G4PEEffectFluoModel&) = delete;
```

<!-- G4PEEffectFluoModel.md ends here -->
