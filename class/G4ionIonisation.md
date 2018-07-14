<!-- G4ionIonisation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 07:58:20 2018 (+0800)
;; Last-Updated: 六 7月 14 12:16:08 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4ionIonisation

**public G4VEnergyLossProcess**

This class manages the ionisation process for ions. Effective charge, nuclear stopping power, energy loss corrections are taken into account.
It inherites from G4VEnergyLossLoss.


* EmModel 0
	* G4BraggModel
    * G4IonFluctuations
* EmModel 1
	* G4BetheBlochModel
	* G4IonFluctuations
* Add ion stoping tables for Generic Ion if the default model is used (with eth ~= 2 MeV)
	* G4WaterStopping


## class

```cpp
public:

  explicit G4ionIonisation(const G4String& name = "ionIoni");

  virtual ~G4ionIonisation();

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) final;

  void AddStoppingData(G4int Z, G4int A, const G4String& materialName,
		       G4PhysicsVector* dVector);

  void ActivateStoppingData(G4bool);

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  // Print out of the class parameters
  virtual void StreamProcessInfo(std::ostream& outFile,
                             G4String endOfLine=G4String("\n")) const override;

  virtual void 
  InitialiseEnergyLossProcess(const G4ParticleDefinition*,
			      const G4ParticleDefinition*) override;

  virtual G4double MinPrimaryEnergy(const G4ParticleDefinition* p,
				    const G4Material*, G4double cut) final;

  inline G4double BetheBlochEnergyThreshold();

private:

  // hide assignment operator
  G4ionIonisation & operator=(const G4ionIonisation &right) = delete;
  G4ionIonisation(const G4ionIonisation&) = delete;
```

<!-- G4ionIonisation.md ends here -->
