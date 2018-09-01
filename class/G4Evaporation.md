<!-- G4Evaporation.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 13:10:43 2018 (+0800)
;; Last-Updated: 六 9月  1 13:13:37 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4Evaporation

**public G4VEvaporation**

Hadronic Process: Nuclear De-excitations

- G4PhotonEvaporation
- G4EvaporationFactory
- G4UnstableFragmentBreakUp
- G4EvaporationGEMFactory
- G4EvaporationDefaultGEMFactory

## class

```cpp
public:

  explicit G4Evaporation(G4VEvaporationChannel* photoEvaporation = nullptr);
	 
  virtual ~G4Evaporation();

  virtual void InitialiseChannels() final;

  // new interface - vector of products is added to the provided vector
  // primary fragment is deleted or is modified and added to the list
  // of products 
  virtual void BreakFragment(G4FragmentVector*, G4Fragment* theNucleus) final;

  void SetDefaultChannel();
  void SetGEMChannel();
  void SetCombinedChannel();

private:

  void InitialiseChannelFactory();

  G4Evaporation(const G4Evaporation &right) = delete;
  const G4Evaporation & operator=(const G4Evaporation &right) = delete;
  G4bool operator==(const G4Evaporation &right) const = delete;
  G4bool operator!=(const G4Evaporation &right) const = delete;

  G4int    fVerbose;
  size_t   nChannels;
  G4double minExcitation;
  G4NistManager* nist;
  G4IonTable*    theTableOfIons;
  G4UnstableFragmentBreakUp* unstableBreakUp;
  G4bool isInitialised;

  G4DeexChannelType channelType;

  std::vector<G4double> probabilities;
```

<!-- G4Evaporation.md ends here -->
