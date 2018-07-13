<!-- G4IonFluctuations.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 05:00:29 2018 (+0800)
;; Last-Updated: 六 7月 14 05:01:37 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4IonFluctuations

**public G4VEmFluctuationModel**

Implementation of ion energy loss fluctuations

## class

```cpp
public:

  explicit G4IonFluctuations(const G4String& nam = "IonFluc");

  virtual ~G4IonFluctuations();

  // Sample fluctuations
  virtual G4double SampleFluctuations(const G4MaterialCutsCouple*,
                                      const G4DynamicParticle*,
                                      G4double tmax,
                                      G4double length,
                                      G4double meanLoss) override;

  // Compute dispertion 
  virtual G4double Dispersion(const G4Material*,
                              const G4DynamicParticle*,
                              G4double tmax,
                              G4double length) override;

  // Initialisation prerun
  virtual void InitialiseMe(const G4ParticleDefinition*) override;

  // Initialisation prestep
  virtual void SetParticleAndCharge(const G4ParticleDefinition*, 
                                    G4double q2) override;

private:

  G4double Factor(const G4Material*, G4double Zeff);
  G4double RelativisticFactor(const G4Material*, G4double Zeff);

  // hide assignment operator
  G4IonFluctuations & operator=(const  G4IonFluctuations &right) = delete;
  G4IonFluctuations(const  G4IonFluctuations&) = delete;
```


<!-- G4IonFluctuations.md ends here -->
