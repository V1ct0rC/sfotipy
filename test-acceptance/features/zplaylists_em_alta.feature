Feature: Playlist Em Alta

    As a user of the sfotipy
    I want to find the top Playlist of sfotipy
    so that I can see find the top Playlist of sfotipy

    Scenario: Find the top Playlist when the user is in the page "Pagina inicial"
        Given I am on the start page
        And I see the "NavBar"
        When I click in the name Em alta
        Then I see the "4" top Playlist of sfotipy
    Scenario: Find the top Playlist when the user is in the page "Explorar"
        Given I am on the page "Explorar"
        And I see the "NavBar"
        When I click in the name Em alta
        Then I see the "4" top Playlist of sfotipy
    Scenario: Find the top Playlist when the user is in the page "Busca"
        Given I am on the page "Busca"
        And I see the "NavBar"
        When I click in the name Em alta
        Then I see the "4" top Playlist of sfotipy
    Scenario: Find the top Playlist when the user is in the page "Playlist"
        Given I am on the page "Playlist"
        And I see the "NavBar"
        When I click in the name Em alta
        Then I see the "4" top Playlist of sfotipy