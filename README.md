# PMGTask
# Contents
- [Features](#features)
- [FolderStructure](#folder-structure)
- [ScreenShots](#screenshots)
- [Test Coverage](#test-coverage)
- [Architecture Diagram](#architecture-diagram)

# Features
- Home Page with TabBar of Films and Starships 
- Load table of Films and Starships  from API - [Link to FILMS](http://swapi.dev/api/films) && [Link to STARSHIPS](http://swapi.dev/api/starships)
- Libraries Used Alamofire and PromiseKit



# Folder Structure

```
TableViewTest
Library
│  └─ Network
│     ├─ NetworkManager
├─ Modules
│  └─ Films
│     ├─ Views
│     │  ├─ FilmList
│     │  │   └─Cells
│     │  │       └─FilmsTableViewCell
│     │  ├─FilmsListViewController
│     │  └─ FilmsListViewControllerTest
│     │  ├─ FilmDetails
│     │  │   ├─FilmDetailsViewController
│     │  │   └─FilmDetailsViewControllerTest
│     ├─ ViewModel
│     │  ├─FilmsViewModel
│     │  └─FilmsViewModelTest
│     ├─ Entities
│     │  ├─ FilmEntities
│     └─ Repository
│        ├─ FilmsApiRepository
│  │      └─ FilmsApiRepositoryMock
│  │
│  └─ Starships
│     ├─ Views
│     │  ├─ StarshipList
│     │  │   └─Cells
│     │  │       └─StarshipsTableViewCell
│     │  ├─StarshipsListViewController
│     │  └─ StarshipsListViewControllerTest
│     │  ├─ StarshipDetails
│     │  │   ├─StarshipDetailsViewController
│     │  │   └─FStarshipDetailsViewControllerTest
│     ├─ ViewModel
│     │  ├─StarshipsViewModel
│     │  └─StarshipsViewModelTest
│     ├─ Entities
│     │  ├─ StarshipEntities
│     └─ Repository
│        ├─ StarshipsApiRepository
│        └─ StarshipsApiRepositoryMock

```

# Screenshots

<img src="https://user-images.githubusercontent.com/18598946/142763508-381ad76e-e855-4cff-b500-6d7684a5fbb0.gif" width="300" height="600"/>




# Test Coverage

<img src="https://user-images.githubusercontent.com/18598946/142763239-1a5bf4dd-8e57-4afd-a56a-c4c8ecead4d7.png" width="2800" height="238"/>



# Architecture Diagram

<img src="https://user-images.githubusercontent.com/18598946/142764115-fb91402a-028c-43bc-bca5-329ffe1d894e.png" width="3000" height="700"/>
