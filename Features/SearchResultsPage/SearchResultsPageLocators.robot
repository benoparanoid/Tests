*** Settings ***
Resource    Features/GlobalResources.robot

*** Variables ***
${languageFilterLabel}    //div[@id="p_n_feature_nine_browse-bin-title"]
${searchResultsIndividualItemList}    //div[@data-component-type="s-search-result"]
${totalNumberOfResultsText}    //span[contains(text(), "results for")]
${pagination}    //span[@class="s-pagination-strip"]
${sortBySelectButton}    //select[@id="s-result-sort-select"]
${authorAndPublishDateText}    //div[@data-component-type="s-search-result"]//div[contains(@class, "title")]/div