<!-- G4ExcitationHandler.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 12:28:07 2018 (+0800)
;; Last-Updated: 六 9月  1 12:34:01 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ExcitationHandler 


- G4Evaporation
- G4PhotonEvaporation
- G4FermiBreakUpVI
- G4StatMF


## class

```cpp
public:

  explicit G4ExcitationHandler(); 
  ~G4ExcitationHandler();

  G4ReactionProductVector* BreakItUp(const G4Fragment &theInitialState);

  // short model description used for automatic web documentation
  void ModelDescription(std::ostream& outFile) const;

  void Initialise();

  // user defined sub-models
  // deletion is responsibility of this handler if isLocal=true 
  void SetEvaporation(G4VEvaporation* ptr, G4bool isLocal=false);
  void SetMultiFragmentation(G4VMultiFragmentation* ptr);
  void SetFermiModel(G4VFermiBreakUp* ptr);
  void SetPhotonEvaporation(G4VEvaporationChannel* ptr);
  void SetDeexChannelsType(G4DeexChannelType val);

  //======== Obsolete methods to be removed =====

  // parameters of sub-models
  inline void SetMaxZForFermiBreakUp(G4int aZ);
  inline void SetMaxAForFermiBreakUp(G4int anA);
  inline void SetMaxAandZForFermiBreakUp(G4int anA,G4int aZ);
  inline void SetMinEForMultiFrag(G4double anE);

  // access methods
  inline G4VEvaporation* GetEvaporation();
  inline G4VMultiFragmentation* GetMultiFragmentation();
  inline G4VFermiBreakUp* GetFermiModel();
  inline G4VEvaporationChannel* GetPhotonEvaporation();

  // for inverse cross section choice
  inline void SetOPTxs(G4int opt);
  // for superimposed Coulomb Barrir for inverse cross sections
  inline void UseSICB();

  //==============================================

private:

  void SetParameters();

  G4ExcitationHandler(const G4ExcitationHandler &right) = delete;
  const G4ExcitationHandler & operator
  =(const G4ExcitationHandler &right) = delete;
  G4bool operator==(const G4ExcitationHandler &right) const = delete;
  G4bool operator!=(const G4ExcitationHandler &right) const = delete;
  
  G4VEvaporation* theEvaporation;  
  G4VMultiFragmentation* theMultiFragmentation;
  G4VFermiBreakUp* theFermiModel;
  G4VEvaporationChannel* thePhotonEvaporation;

  const G4ParticleDefinition* electron;
  G4int icID;

  G4int maxZForFermiBreakUp;
  G4int maxAForFermiBreakUp;
  G4double minEForMultiFrag;
  G4double minExcitation;

  G4IonTable* theTableOfIons;
  G4NistManager* nist;

  G4int  fVerbose;
  G4bool isInitialised;
  G4bool isEvapLocal;
  G4bool isActive;

  // list of fragments to store final result   
  std::vector<G4Fragment*> theResults;

  // list of fragments to store intermediate result   
  std::vector<G4Fragment*> results;

  // list of fragments to apply PhotonEvaporation 
  std::vector<G4Fragment*> thePhotoEvapList;

  // list of fragments to apply Evaporation or Fermi Break-Up
  std::vector<G4Fragment*> theEvapList; 
```

<!-- G4ExcitationHandler.md ends here -->
