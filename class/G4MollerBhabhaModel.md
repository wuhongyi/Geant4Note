<!-- G4MollerBhabhaModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 07:24:02 2018 (+0800)
;; Last-Updated: 日 7月 15 07:25:40 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4MollerBhabhaModel

**public G4VEmModel**

Implementation of energy loss process and delta-electrons production of electrons and positrons

## class

```cpp
public:

  explicit G4MollerBhabhaModel(const G4ParticleDefinition* p = nullptr, 
			       const G4String& nam = "MollerBhabha");

  virtual ~G4MollerBhabhaModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual G4double ComputeCrossSectionPerElectron(
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double cutEnergy,
				 G4double maxEnergy);
				 
  virtual G4double ComputeCrossSectionPerAtom(
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double Z, G4double A,
				 G4double cutEnergy,
				 G4double maxEnergy) override;
				 				 
  virtual G4double CrossSectionPerVolume(const G4Material*,
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double cutEnergy,
				 G4double maxEnergy) override;
				 
  virtual G4double ComputeDEDXPerVolume(const G4Material*,
				const G4ParticleDefinition*,
				G4double kineticEnergy,
				G4double cutEnergy) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;

protected:

  virtual G4double MaxSecondaryEnergy(const G4ParticleDefinition*,
				      G4double kinEnergy) final;
			      
  inline void SetParticle(const G4ParticleDefinition* p);


  
private:

  // hide assignment operator 
  G4MollerBhabhaModel & operator=(const  G4MollerBhabhaModel &right) = delete;
  G4MollerBhabhaModel(const  G4MollerBhabhaModel&) = delete;
```

<!-- G4MollerBhabhaModel.md ends here -->
