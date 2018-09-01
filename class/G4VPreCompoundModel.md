<!-- G4VPreCompoundModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:35:13 2018 (+0800)
;; Last-Updated: 六 9月  1 12:36:25 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VPreCompoundModel

**public G4HadronicInteraction**

Base class for pre-equilibrium decay models in geant4. By merit of inheriting from this class a pre-equilibrium decay model can be used in conjunction with any cascade, string parton model or other high energy generator in the generation of final states for inelastic scattering.

## class

```cpp
public:

  explicit G4VPreCompoundModel(G4ExcitationHandler* ptr = nullptr, 
			       const G4String& modelName = "PrecompoundModel");

  virtual ~G4VPreCompoundModel();
  
public:

  virtual G4ReactionProductVector* DeExcite(G4Fragment& aFragment) = 0;

  virtual void DeExciteModelDescription(std::ostream& outFile) const = 0;

  inline void SetExcitationHandler(G4ExcitationHandler* ptr);
    
  inline G4ExcitationHandler* GetExcitationHandler() const;
  
private:

  G4VPreCompoundModel(const G4VPreCompoundModel &) = delete;
  const G4VPreCompoundModel& operator=(const G4VPreCompoundModel &right) = delete;
  G4bool operator==(const G4VPreCompoundModel &right) const = delete;
  G4bool operator!=(const G4VPreCompoundModel &right) const = delete;

  G4ExcitationHandler* theExcitationHandler;
```

<!-- G4VPreCompoundModel.md ends here -->
