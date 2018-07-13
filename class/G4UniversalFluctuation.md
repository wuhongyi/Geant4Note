// G4UniversalFluctuation.md --- 
// 
// Description: 
// Author: Hongyi Wu(吴鸿毅)
// Email: wuhongyi@qq.com 
// Created: 六 7月 14 05:03:40 2018 (+0800)
// Last-Updated: 六 7月 14 05:05:32 2018 (+0800)
//           By: Hongyi Wu(吴鸿毅)
//     Update #: 1
// URL: http://wuhongyi.cn -->

# G4UniversalFluctuation

**public G4VEmFluctuationModel**

Implementation of energy loss fluctuations

## class

```cpp
public:

  explicit G4UniversalFluctuation(const G4String& nam = "UniFluc");

  virtual ~G4UniversalFluctuation();

  virtual G4double SampleFluctuations(const G4MaterialCutsCouple*,
                                      const G4DynamicParticle*,
                                      G4double,
                                      G4double,
                                      G4double) override;

  virtual G4double Dispersion(const G4Material*,
                              const G4DynamicParticle*,
                              G4double,
                              G4double) override;

  virtual void InitialiseMe(const G4ParticleDefinition*) final;

  // Initialisation prestep
  virtual void SetParticleAndCharge(const G4ParticleDefinition*, 
                                    G4double q2) final;

private:

  inline void AddExcitation(CLHEP::HepRandomEngine* rndm, 
                            G4double a, G4double e, G4double& eav, 
                            G4double& eloss, G4double& esig2); 

  inline void SampleGauss(CLHEP::HepRandomEngine* rndm, 
                          G4double eav, G4double esig2, 
                          G4double& eloss); 

  // hide assignment operator
  G4UniversalFluctuation & operator=(const  G4UniversalFluctuation &right) = delete;
  G4UniversalFluctuation(const  G4UniversalFluctuation&) = delete;
```


// 
// G4UniversalFluctuation.md ends here
