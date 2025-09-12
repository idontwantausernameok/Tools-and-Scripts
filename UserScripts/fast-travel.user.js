// ==UserScript==
// @name         PoE2 Trade Fast Travel
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Auto-click Travel to Hideout buttons with toggles
// @author       You
// @match        https://www.pathofexile.com/trade2/*
// @grant        none
// ==/UserScript==

(function() {
    "use strict";

    // State variables
    let processing = false;
    let fastTravelEnabled = false;
    let contestEnabled = false;
    let contestTimeout = 1000;
    let resetEnabled = false;
    let resetValue = 4;
    let existingRowIds = new Set();
    let resetTimer = null;
    //var travelText = "Travel to Hideout";
    //var successText = "Teleporting!";
    //var contestText = "In demand. Teleport anyway?";
    //const signal_contest = 1;
    const signal_teleported = 0;
    const delay = (ms) => new Promise((res) => setTimeout(res, ms));

    // Add CSS styles
    const style = document.createElement("style");
    style.textContent = `
        .poe-toggle-container {
            display: inline-flex;
            gap: 10px;
            margin-left: 15px;
            align-items: center;
        }

        .poe-toggle {
            position: relative;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            user-select: none;
        }

        .poe-toggle-switch {
            position: relative;
            width: 40px;
            height: 20px;
            background-color: #ccc;
            border-radius: 20px;
            transition: background-color 0.3s;
        }

        .poe-toggle-switch.active {
            background-color: #4CAF50;
        }

        .poe-toggle-slider {
            position: absolute;
            top: 2px;
            left: 2px;
            width: 16px;
            height: 16px;
            background-color: white;
            border-radius: 50%;
            transition: transform 0.3s;
        }

        .poe-toggle-switch.active .poe-toggle-slider {
            transform: translateX(20px);
        }

        .poe-toggle-label {
            font-size: 14px;
            font-weight: 500;
            color: #fff;
        }

        .poe-toggle-with-input {
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .poe-toggle-textbox {
            width: 55px;
            height: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: center;
            font-size: 12px;
            padding: 0 2px;
        }

        .poe-toggle-textbox:focus {
            outline: none;
            border-color: #4CAF50;
        }
    `;
    document.head.appendChild(style);

    // Create toggle elements
    function createToggle(id, label, callback) {
        const toggle = document.createElement("div");
        toggle.className = "poe-toggle";
        toggle.innerHTML = `
            <span class="poe-toggle-label">${label}</span>
            <div class="poe-toggle-switch" id="${id}">
                <div class="poe-toggle-slider"></div>
            </div>
        `;

        toggle.addEventListener("click", callback);
        return toggle;
    }

    // Create toggle with textbox
    function createToggleWithTextbox(id, label, callback, textboxCallback) {
        const toggle = document.createElement("div");
        toggle.className = "poe-toggle";
        toggle.innerHTML = `
            <div class="poe-toggle-with-input">
                <span class="poe-toggle-label">${label}</span>
                <div class="poe-toggle-switch" id="${id}">
                    <div class="poe-toggle-slider"></div>
                </div>
                <input type="number" class="poe-toggle-textbox" id="${id}-textbox" min="2" max="999" value="4">
            </div>
        `;

        const switchElement = toggle.querySelector(".poe-toggle-switch");
        const textboxElement = toggle.querySelector(".poe-toggle-textbox");

        switchElement.addEventListener("click", callback);
        textboxElement.addEventListener("input", textboxCallback);
        textboxElement.addEventListener("change", textboxCallback);

        return toggle;
    }

    function createTextbox(id, label, callback, textboxCallback) {
        const toggle = document.createElement("div");
        toggle.className = "poe-input";
        toggle.innerHTML = `
            <div class="poe-toggle-with-input">
                <span class="poe-toggle-label">${label}</span>
                <input type="number" class="poe-toggle-textbox" id="${id}-textbox" min="2" max="9999" value="1000">
            </div>
        `;

        const textboxElement = toggle.querySelector(".poe-toggle-textbox");

        textboxElement.addEventListener("input", callback);
        textboxElement.addEventListener("change", callback);

        return toggle;
    }

    // Toggle Fast Travel
    function toggleFastTravel() {
        fastTravelEnabled = !fastTravelEnabled;
        const switchElement = document.getElementById("fast-travel-switch");
        if (fastTravelEnabled) {
            switchElement.classList.add("active");
        } else {
            switchElement.classList.remove("active");
        }
    }

    // Toggle Contest
    function toggleContest() {
        contestEnabled = !contestEnabled;
        const switchElement = document.getElementById("contest-switch");
        if (contestEnabled) {
            switchElement.classList.add("active");
        } else {
            switchElement.classList.remove("active");
        }
    }

    // Toggle Reset
    function toggleReset() {
        resetEnabled = !resetEnabled;
        const switchElement = document.getElementById("reset-switch");
        if (resetEnabled) {
            switchElement.classList.add("active");
        } else {
            switchElement.classList.remove("active");
        }
    }

    // Handle Reset textbox input
    function handleResetInput(event) {
        const value = parseInt(event.target.value) || 0;
        resetValue = Math.max(2, Math.min(999, value));
        event.target.value = resetValue;
    }

    // Handle Reset textbox input
    function handleContestInput(event) {
        const value = parseInt(event.target.value) || 0;
        contestTimeout = Math.max(1, Math.min(9999, value));
        event.target.value = contestTimeout;
    }

    // Add toggles to the page
    function addToggles() {
        // Look for the search area or results header
        const searchContainer =
            document.querySelector(".search-advanced") ||
            document.querySelector(".search-bar") ||
            document.querySelector(".row.row-total");

        if (!searchContainer) {
            setTimeout(addToggles, 1000);
            return;
        }

        // Check if toggles already exist
        if (document.querySelector(".poe-toggle-container")) return;

        const toggleContainer = document.createElement("div");
        toggleContainer.className = "poe-toggle-container";

        const fastTravelToggle = createToggle(
            "fast-travel-switch",
            "Fast Travel",
            toggleFastTravel,
        );
        const contestToggle = createToggle(
            "contest-switch",
            "Contest",
            toggleContest,
        );
        const resetToggle = createToggleWithTextbox(
            "reset-switch",
            "Reset",
            toggleReset,
            handleResetInput,
        );
        const contestInput = createTextbox(
            "contest-timeout",
            "Contest Timeout",
            handleContestInput,
        );

        toggleContainer.appendChild(fastTravelToggle);
        toggleContainer.appendChild(contestToggle);
        toggleContainer.appendChild(resetToggle);
        toggleContainer.appendChild(contestInput);

        // Insert after the search container or at the end
        if (searchContainer.nextSibling) {
            searchContainer.parentNode.insertBefore(
                toggleContainer,
                searchContainer.nextSibling,
            );
        } else {
            searchContainer.parentNode.appendChild(toggleContainer);
        }
    }

    // Handler function for new rows
    async function handleNewRow(rowElement, rowId) {
        if (processing) {
            return;
        }
        processing = true;

        if (fastTravelEnabled) {
            // Click travel button, get resulting button text and save it to clickResult
            var clickResult = await travel(rowElement);
			if (clickResult === signal_teleported)
			{
                toggleFastTravel();

                // Start countdown if reset is enabled and Fast Travel was turned off
                if (!fastTravelEnabled && resetEnabled && resetValue > 0) {
                    // Start a count-down to toggle Fast Travel on.
                    if (resetTimer) clearTimeout(resetTimer);
                    resetTimer = setTimeout(() => {
                        toggleFastTravel();
                    }, resetValue * 1000);
                }
			}
        }
        processing = false;
    }

    // Click travel button and return resulting text
    async function travel(rowElement) {
        const travelButton = rowElement.querySelector("button.direct-btn");
        if (!travelButton) {
            return "";
        }
        travelButton.click();

        if (contestEnabled)
        {
            for (let i = 0; i < contestTimeout/10; i++) {
                const contested = rowElement.querySelector("button.expired");
                if (contested) {
                    contested.click();
                    return signal_teleported;
                }
                await delay(10);
            }
        }
        else
        {
            for (let i = 0; i < 50; i++) {
                const teleported = rowElement.querySelector("button.disabled");

                if (teleported) {
                    return signal_teleported;
                }
                await delay(10);
            }
        }
        return -1;
    }

    // Check for new rows
    function checkForNewRows() {
        const currentRows = document.querySelectorAll(".row[data-id]");

        currentRows.forEach((row) => {
            const rowId = row.getAttribute("data-id");
            if (rowId && !existingRowIds.has(rowId)) {
                // This is a new row
                existingRowIds.add(rowId);
                handleNewRow(row, rowId);
            }
        });
    }

    // Initialize the script
    function init() {
        // Wait for the page to load
        if (document.readyState === "loading") {
            document.addEventListener("DOMContentLoaded", init);
            return;
        }

        // Add toggles
        setTimeout(addToggles, 1000);

        // Start checking for new rows periodically
        setInterval(checkForNewRows, 10);
    }

    init();
})();