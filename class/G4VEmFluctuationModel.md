<!-- G4VEmFluctuationModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 04:57:48 2018 (+0800)
;; Last-Updated: 六 7月 14 04:59:00 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4VEmFluctuationModel

Abstract class for interface to simualtion of energy loss fluctuations

## class

```cpp
public:

  explicit G4VEmFluctuationModel(const G4String& nam);

  virtual ~G4VEmFluctuationModel();

  //------------------------------------------------------------------------
  // Virtual methods to be implemented for the concrete model
  //------------------------------------------------------------------------

  virtual G4double SampleFluctuations(const G4MaterialCutsCouple*,
				      const G4DynamicParticle*,
				      G4double tmax,
				      G4double length,
				      G4double meanLoss) = 0;

  virtual G4double Dispersion(const G4Material*,
                              const G4DynamicParticle*,
			      G4double tmax,
			      G4double length) = 0;

  //------------------------------------------------------------------------
  // Methods with standard implementation; may be overwritten if needed 
  //------------------------------------------------------------------------

  virtual void InitialiseMe(const G4ParticleDefinition*);

  virtual void SetParticleAndCharge(const G4ParticleDefinition*, G4double q2);

  //------------------------------------------------------------------------
  // Generic methods common to all models
  //------------------------------------------------------------------------

  inline const G4String& GetName() const;

private:

  // hide assignment operator
  G4VEmFluctuationModel & 
    operator=(const  G4VEmFluctuationModel &right) = delete;
  G4VEmFluctuationModel(const  G4VEmFluctuationModel&) = delete;
```

<!-- G4VEmFluctuationModel.md ends here -->
