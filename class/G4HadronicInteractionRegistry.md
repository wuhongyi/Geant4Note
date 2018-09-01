<!-- G4HadronicInteractionRegistry.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 13:21:16 2018 (+0800)
;; Last-Updated: 六 9月  1 13:22:19 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4HadronicInteractionRegistry

**静态类**

This is a singleton class to store all hadronic interactions

## class

```cpp
friend class G4ThreadLocalSingleton<G4HadronicInteractionRegistry>;

public:

  static G4HadronicInteractionRegistry* Instance();
  // access 
  
  ~G4HadronicInteractionRegistry();

  void RegisterMe(G4HadronicInteraction * aModel);
  // register new model

  void RemoveMe(G4HadronicInteraction * aModel);
  // deregister model

  void Clean();
  // delete all models

  void InitialiseModels();
  // delete all models

  G4HadronicInteraction* FindModel(const G4String& name);
  // find existing hadronic interaction by name

  std::vector<G4HadronicInteraction*> FindAllModels(const G4String& name);
  // find all existing hadronic interactions by name

private:

  G4HadronicInteractionRegistry();

  static G4ThreadLocal G4HadronicInteractionRegistry* instance;

  std::vector <G4HadronicInteraction*>  allModels;
  G4bool isInitialized;
```

<!-- G4HadronicInteractionRegistry.md ends here -->
