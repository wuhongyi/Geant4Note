<!-- G4HadronElastic.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 06:55:19 2018 (+0800)
;; Last-Updated: 五 8月 10 06:56:03 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4HadronElastic

**public G4HadronicInteraction**

Default model for elastic scattering; GHEISHA algorithm is used 

## class

```cpp
public:

  G4HadronElastic(const G4String& name = "hElasticLHEP");

  virtual ~G4HadronElastic();
 
  // implementation of the G4HadronicInteraction interface
  virtual G4HadFinalState * ApplyYourself(const G4HadProjectile & aTrack, 
					  G4Nucleus & targetNucleus);

  // sample momentum transfer using Lab. momentum
  virtual G4double SampleInvariantT(const G4ParticleDefinition* p, 
				    G4double plab,
				    G4int Z, G4int A);

  inline void SetLowestEnergyLimit(G4double value);

  inline G4double LowestEnergyLimit() const;

  inline G4double ComputeMomentumCMS(const G4ParticleDefinition* p, 
				     G4double plab, G4int Z, G4int A);
  
  virtual void ModelDescription(std::ostream&) const;

private:

  G4ParticleDefinition* theProton;
  G4ParticleDefinition* theNeutron;
  G4ParticleDefinition* theDeuteron;
  G4ParticleDefinition* theAlpha;

  G4double lowestEnergyLimit;  
```

<!-- G4HadronElastic.md ends here -->
