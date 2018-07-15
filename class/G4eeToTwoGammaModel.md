<!-- G4eeToTwoGammaModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 08:38:06 2018 (+0800)
;; Last-Updated: 日 7月 15 08:40:56 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4eeToTwoGammaModel

**public G4VEmModel**

```
Implementation of e+ annihilation into 2 gamma
The secondaries Gamma energies are sampled using the Heitler cross section.
A modified version of the random number techniques of Butcher & Messel is used (Nuc Phys 20(1960),15).

GEANT4 internal units.
Note 1: The initial electron is assumed free and at rest.
Note 2: The annihilation processes producing one or more than two photons are ignored, as negligible compared to the two photons process.
```

## class

```cpp
public:

  explicit G4eeToTwoGammaModel(const G4ParticleDefinition* p = 0,
                               const G4String& nam = "eplus2gg");

  virtual ~G4eeToTwoGammaModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;
  
  virtual G4double ComputeCrossSectionPerElectron(
                                const G4ParticleDefinition*,
                                      G4double kinEnergy, 
                                      G4double cutEnergy = 0.,
                                      G4double maxEnergy = DBL_MAX);
  
  virtual G4double ComputeCrossSectionPerAtom(
                                const G4ParticleDefinition*,
                                      G4double kinEnergy, 
                                      G4double Z, 
                                      G4double A = 0., 
                                      G4double cutEnergy = 0.,
                                      G4double maxEnergy = DBL_MAX) final;

  virtual G4double CrossSectionPerVolume(const G4Material*,
					 const G4ParticleDefinition*,
					 G4double kineticEnergy,
					 G4double cutEnergy,
					 G4double maxEnergy) final;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;

private:

  // hide assignment operator
  G4eeToTwoGammaModel & operator=(const  G4eeToTwoGammaModel &right) = delete;
  G4eeToTwoGammaModel(const  G4eeToTwoGammaModel&) = delete;
```

<!-- G4eeToTwoGammaModel.md ends here -->
