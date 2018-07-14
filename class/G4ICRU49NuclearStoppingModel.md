<!-- G4ICRU49NuclearStoppingModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 12:02:11 2018 (+0800)
;; Last-Updated: 六 7月 14 12:03:30 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ICRU49NuclearStoppingModel

**public G4VEmModel**

Implementation of the ICRU'49 model of nuclear stopping 

## class

```cpp
public:

  explicit G4ICRU49NuclearStoppingModel(const G4String& nam = 
					"ICRU49NucStopping");

  virtual ~G4ICRU49NuclearStoppingModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) final;

  // main method to compute dEdx
  virtual G4double ComputeDEDXPerVolume(const G4Material*,
                                        const G4ParticleDefinition*,
                                        G4double kineticEnergy,
                                        G4double cutEnergy = DBL_MAX) final;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*, 
				 G4double, G4double) final;

private:

  void InitialiseArray();

  G4double NuclearStoppingPower(G4double kineticEnergy,
				G4double Z1, G4double Z2,
				G4double A1, G4double A2);

  //  hide assignment operator
  G4ICRU49NuclearStoppingModel & operator=
  (const  G4ICRU49NuclearStoppingModel &right) = delete;
  G4ICRU49NuclearStoppingModel(const  G4ICRU49NuclearStoppingModel&) = delete;
```


<!-- G4ICRU49NuclearStoppingModel.md ends here -->
