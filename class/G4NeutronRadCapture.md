<!-- G4NeutronRadCapture.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:54:16 2018 (+0800)
;; Last-Updated: 五 8月 10 07:54:49 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4NeutronRadCapture

**public G4HadronicInteraction**

Sampling of neutron radiative capture 

## class

```cpp
public:

  explicit G4NeutronRadCapture();

  virtual ~G4NeutronRadCapture();
 
  virtual G4HadFinalState* ApplyYourself(const G4HadProjectile & aTrack, 
					 G4Nucleus & targetNucleus) final;

  virtual void InitialiseModel() final;

private:

  G4NeutronRadCapture & operator=(const G4NeutronRadCapture &right) = delete;
  G4NeutronRadCapture(const G4NeutronRadCapture&) = delete;

  G4int icID;
  const G4ParticleDefinition* electron;
  G4double lowestEnergyLimit;
  G4double minExcitation;
  G4VEvaporationChannel* photonEvaporation;
  G4IonTable*  theTableOfIons;
  G4LorentzVector lab4mom;
```

<!-- G4NeutronRadCapture.md ends here -->
