<!-- G4VIntraNuclearTransportModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:13:15 2018 (+0800)
;; Last-Updated: 五 8月 10 07:14:22 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VIntraNuclearTransportModel

**public G4HadronicInteraction**

// Base class for intra-nuclear transport models in geant4. By merit of inheriting from this class a intra-nuclear transport model can be used in conjunction with any precompound, string parton model or other high energy generator in the generation of final states for inelastic scattering.

## class

```cpp
public:

  explicit G4VIntraNuclearTransportModel(const G4String& mName = "CascadeModel",
					 G4VPreCompoundModel* ptr = nullptr);

  virtual ~G4VIntraNuclearTransportModel();

  virtual 
  G4ReactionProductVector* Propagate(G4KineticTrackVector* theSecondaries,
				     G4V3DNucleus* theNucleus) = 0;

  virtual 
  G4ReactionProductVector* PropagateNuclNucl(G4KineticTrackVector* theSecondaries,
				     G4V3DNucleus* theNucleus,
                                     G4V3DNucleus* theProjectileNucleus);    // Uzhi Nov. 2012

  inline void SetDeExcitation(G4VPreCompoundModel* ptr);

  inline void Set3DNucleus(G4V3DNucleus* const value);

  inline void SetPrimaryProjectile(const G4HadProjectile &aPrimary);

  inline const G4String& GetModelName() const;

  virtual void ModelDescription(std::ostream& outFile) const ;
  virtual void PropagateModelDescription(std::ostream& outFile) const ;

private:

  G4VIntraNuclearTransportModel(const G4VIntraNuclearTransportModel& right) = delete;
  const G4VIntraNuclearTransportModel& operator=(const G4VIntraNuclearTransportModel &right) = delete;
  int operator==(const G4VIntraNuclearTransportModel& right) const = delete;
  int operator!=(const G4VIntraNuclearTransportModel& right) const = delete;

protected:

  inline G4V3DNucleus* Get3DNucleus() const;

  inline G4VPreCompoundModel* GetDeExcitation() const;

  inline const G4HadProjectile* GetPrimaryProjectile() const;

  G4String theTransportModelName;

  G4V3DNucleus* the3DNucleus;

  G4VPreCompoundModel* theDeExcitation;

  const G4HadProjectile* thePrimaryProjectile;
```

<!-- G4VIntraNuclearTransportModel.md ends here -->
