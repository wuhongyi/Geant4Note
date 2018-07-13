<!-- G4hIonisation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 7月 13 04:37:52 2018 (+0800)
;; Last-Updated: 六 7月 14 05:20:35 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 4
;; URL: http://wuhongyi.cn -->

# G4hIonisation

This class manages the ionisation process for hadrons.

* EmModel 0
	* q > 0.0 :  G4BraggModel
	* q == 0  :  G4ICRU73QOModel
    * G4IonFluctuations
* EmModel 1
	* G4BetheBlochModel
	* G4UniversalFluctuation


## class

```cpp
public:

  explicit G4hIonisation(const G4String& name = "hIoni");

  virtual ~G4hIonisation();

  virtual G4bool IsApplicable(const G4ParticleDefinition& p) override;

  virtual G4double MinPrimaryEnergy(const G4ParticleDefinition* p,
				    const G4Material*, G4double cut) final;

  // Print out of the class parameters
  virtual void PrintInfo() final;

  // print documentation in html format
  virtual void ProcessDescription(std::ostream&) const override;

protected:

  virtual void 
  InitialiseEnergyLossProcess(const G4ParticleDefinition*,
			      const G4ParticleDefinition*) override;

private:

  // hide assignment operator
  G4hIonisation & operator=(const G4hIonisation &right) = delete;
  G4hIonisation(const G4hIonisation&) = delete;
```


<!-- G4hIonisation.md ends here -->
