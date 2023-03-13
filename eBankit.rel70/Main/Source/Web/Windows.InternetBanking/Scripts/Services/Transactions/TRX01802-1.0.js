
eBankit.Presentation.TRX01802 = {}

function getElementsByClassName(objElement, strTagName, strClassName) {
    var objCollection = objElement.getElementsByTagName(strTagName);
    var arReturn = [];
    var strClass, arClass, iClass, iCounter;

    for (iCounter = 0; iCounter < objCollection.length; iCounter++) {
        strClass = objCollection[iCounter].className;
        if (strClass) {
            arClass = strClass.split(' ');
            for (iClass = 0; iClass < arClass.length; iClass++) {
                if (arClass[iClass] == strClassName) {
                    arReturn.push(objCollection[iCounter]);
                    break;
                }
            }
        }
    }

    objCollection = null;
    return (arReturn);
}

var drag = {
    objCurrent: null,

    arTargets: [],
  
    initialise: function (objNode) {
        // Add event handlers		
        objNode.onkeydown = drag.keyboardDragDrop;
        document.body.onclick = drag.removePopup;


    },

    keyboardDragDrop: function (objEvent) {
        objEvent = objEvent || window.event;
        drag.objCurrent = this;
        var accNumber = $(this).find('.accountNumber').text();
        var groupsNameIds = hdnGroupNamesIDs.val();

        var arrayGroups = [];
        if (groupsNameIds.length > 0) {
            arrayGroups = jQuery.parseJSON(groupsNameIds);
        }

        var verifiedGroups = drag.verifyAccountInGroups(accNumber.trim());
        var arChoices = [];

        $.each(arrayGroups, function (i, elem1) {
            if (elem1.isOwner) {
                if (verifiedGroups.length > 0) {
                    if (!verifiedGroups.includes(elem1.idGroup.toString())) {
                        arChoices.push(elem1.groupName + '#' + elem1.idGroup);
                    }
                } else {
                    arChoices.push(elem1.groupName + '#' + elem1.idGroup);
                }
            }
        });


        var iKey = objEvent.keyCode;
        var objItem = drag.objCurrent;


        var strExisting = objItem.parentNode.getAttribute('id');
        var objMenu, objChoice, iCounter;
        objItem.removeAttribute('style');
        if (iKey == 32 || iKey == 13) {
            objEvent.preventDefault();
            objItem.setAttribute('style', 'background-color: rgba(239, 123, 48, 0.2);border: 3px solid rgba(239, 123, 48, 1)');
            document.onkeydown = function () { return objEvent.keyCode == 38 || objEvent.keyCode == 40 ? false : true; };
            // Set ARIA properties
            drag.objCurrent.setAttribute('aria-grabbed', 'true');
            drag.objCurrent.setAttribute('aria-owns', 'popup');
            // Build context menu	
            objThead = document.createElement('thead');
            objTableRowHeader = document.createElement('tr');
            objTableHeader = document.createElement('th');
            objMenu = document.createElement('table');
            objTBody = document.createElement('tBody');
            objMenu.setAttribute('id', 'popup');
            objMenu.setAttribute('role', 'menu');
            objTableHeader.appendChild(document.createTextNode(top.eBankit.Presentation.GetResource("TRX01802MoveToGroup")));
            objTableRowHeader.appendChild(objTableHeader);
            objThead.appendChild(objTableHeader);
            objMenu.appendChild(objThead);
            if (arChoices.length > 0) {
                for (iCounter = 0; iCounter < arChoices.length; iCounter++) {
                    if (drag.arTargets[iCounter] != strExisting) {
                        objElemTR = document.createElement('tr');
                        objInputHdn = document.createElement('input');
                        objInputHdn.setAttribute("type", "hidden");
                        objInputHdn.setAttribute("value", arChoices[iCounter].split('#')[1]);
                        objChoice = document.createElement('td');
                        objChoice.appendChild(document.createTextNode(arChoices[iCounter].split('#')[0]));
                        objElemTR.appendChild(objChoice);
                        objElemTR.appendChild(objInputHdn);
                        objElemTR.tabIndex = -1;
                        objElemTR.setAttribute('role', 'menuitem');
                        objElemTR.onkeydown = drag.handleContext;
                        objElemTR.onmouseover = function () {
                            if (this.className.indexOf('hover') < 0) {
                                this.className += ' hover';
                            }
                        };
                        objElemTR.onmouseout = function () {
                            this.className = this.className.replace(/\s*hover/, '');
                        };
                        objTBody.appendChild(objElemTR);
                    }
                }
            }
            else {
                objElemTR = document.createElement('tr');
                objChoice = document.createElement('td');
                objChoice.appendChild(document.createTextNode(top.eBankit.Presentation.GetResource("TRX01802MoveToGroupEmpty")));
                objElemTR.appendChild(objChoice);
                objElemTR.tabIndex = -1;
                objElemTR.setAttribute('role', 'menuitem');
                objElemTR.onkeydown = drag.handleContext;
                objElemTR.onmouseover = function () {
                    if (this.className.indexOf('hover') < 0) {
                        this.className += ' hover';
                    }
                };
                objElemTR.onmouseout = function () {
                    this.className = this.className.replace(/\s*hover/, '');
                };
                objTBody.appendChild(objElemTR);
            }
            objMenu.appendChild(objTBody)
            objItem.appendChild(objMenu);
            objTBody.firstChild.focus();
            objTBody.firstChild.className = 'focus';
            drag.identifyTargets(true);
        }
    },


    removePopup: function () {
        document.onkeydown = null;

        var objContext = document.getElementById('popup');

        if (objContext) {
            objContext.parentNode.removeChild(objContext);
            drag.objCurrent.removeAttribute('style');
        }
    },

    handleContext: function (objEvent) {
        objEvent = objEvent || window.event;
        var objItem = objEvent.target || objEvent.srcElement;
        var iKey = objEvent.keyCode;
        var objFocus, objList, strTarget, iCounter;

        // Cancel default behaviour
        if (objEvent.stopPropagation) {
            objEvent.stopPropagation();
        }
        else if (objEvent.cancelBubble) {
            objEvent.cancelBubble = true;
        }
        if (objEvent.preventDefault) {
            objEvent.preventDefault();
        }
        else if (objEvent.returnValue) {
            objEvent.returnValue = false;
        }

        switch (iKey) {
            case 40: // Down arrow
                objFocus = objItem.nextSibling;                
                if (!objFocus) {
                    objFocus = objItem;
                }
                objItem.className = '';
                objFocus.focus();
                objFocus.className = 'focus';                    
                break;
            case 38: // Up arrow
                objFocus = objItem.previousSibling;
                if (!objFocus) {
                    objFocus = objItem;
                }
                objItem.className = '';
                objFocus.focus();
                objFocus.className = 'focus';                
                break;
            case 13: // Enter
                strTargetGroupID = $(objItem).find('input').val();
                drag.dropObject(strTargetGroupID);
                break;
            case 27: // Escape
            case 9: // Tab
                drag.objCurrent.removeAttribute('aria-owns');
                drag.objCurrent.removeChild(objItem.parentNode.parentNode);
                drag.objCurrent.focus();
                drag.objCurrent.removeAttribute('style');
                for (iCounter = 0; iCounter < drag.arTargets.length; iCounter++) {
                    objList = $('#' + drag.arTargets[iCounter]).parent();
                    drag.objCurrent.setAttribute('aria-grabbed', 'false');
                    objList.removeAttribute('aria-dropeffect');
                    objList.className = '';
                }
                break;
        }
    },

    start: function (objEvent) {
        objEvent = objEvent || window.event;
        drag.removePopup();
        // Initialise properties
        drag.objCurrent = this;

        drag.objCurrent.lastX = objEvent.clientX;
        drag.objCurrent.lastY = objEvent.clientY;
        drag.objCurrent.style.zIndex = '2';
        drag.objCurrent.setAttribute('aria-grabbed', 'true');

        document.onmousemove = drag.drag;
        document.onmouseup = drag.end;
        drag.identifyTargets(true);

        return false;
    },

    drag: function (objEvent) {
        objEvent = objEvent || window.event;

        // Calculate new position
        var iCurrentY = objEvent.clientY;
        var iCurrentX = objEvent.clientX;
        var iYPos = parseInt(drag.objCurrent.style.top, 10);
        var iXPos = parseInt(drag.objCurrent.style.left, 10);
        var iNewX, iNewY;

        iNewX = iXPos + iCurrentX - drag.objCurrent.lastX;
        iNewY = iYPos + iCurrentY - drag.objCurrent.lastY;

        drag.objCurrent.style.left = iNewX + 'px';
        drag.objCurrent.style.top = iNewY + 'px';
        drag.objCurrent.lastX = iCurrentX;
        drag.objCurrent.lastY = iCurrentY;

        return false;
    },

    calculatePosition: function (objElement, strOffset) {
        var iOffset = 0;

        // Get offset position in relation to parent nodes
        if (objElement.offsetParent) {
            do {
                iOffset += objElement[strOffset];
                objElement = objElement.offsetParent;
            } while (objElement);
        }

        return iOffset;
    },

    identifyTargets: function (bHighlight) {
        var strExisting = drag.objCurrent.parentNode.getAttribute('id');
        var objList, iCounter;

        // Highlight the targets for the current drag item
        for (iCounter = 0; iCounter < drag.arTargets.length; iCounter++) {
            objList = $('#' + drag.arTargets[iCounter]).parent()
            if (bHighlight && drag.arTargets[iCounter] != strExisting) {
                objList.className = 'highlight';
                objList.attr('aria-dropeffect', 'move');
            }
            else {
                objList.className = '';
                objList.removeAttribute('aria-dropeffect');
            }
        }
    },

    getTarget: function () {
        var strExisting = drag.objCurrent.getAttribute('id');
        var iCurrentLeft = drag.calculatePosition(drag.objCurrent, 'offsetLeft');
        var iCurrentTop = drag.calculatePosition(drag.objCurrent, 'offsetTop');
        var iTolerance = 40;
        var objList, iLeft, iRight, iTop, iBottom, iCounter;

        for (iCounter = 0; iCounter < drag.arTargets.length; iCounter++) {
            if (drag.arTargets[iCounter] != strExisting) {
                // Get position of the list
                objList = document.getElementById(drag.arTargets[iCounter]);
                iLeft = drag.calculatePosition(objList, 'offsetLeft') - iTolerance;
                iRight = iLeft + objList.offsetWidth + iTolerance;
                iTop = drag.calculatePosition(objList, 'offsetTop') - iTolerance;
                iBottom = iTop + objList.offsetHeight + iTolerance;

                // Determine if current object is over the target
                if (iCurrentLeft > iLeft && iCurrentLeft < iRight && iCurrentTop > iTop && iCurrentTop < iBottom) {
                    return drag.arTargets[iCounter];
                }
            }
        }

        // Current object is not over a target
        return '';
    },
    findGroup: function (strGroupID) {
        objGroups = $('#dragGroups').find('.groupInfo');
        var grpAccContainer;
        $(objGroups).each(function () {
            var groupID = $(this).siblings('input');
            if (strGroupID === $(groupID).val()) {
                grpAccContainer = $(groupID).siblings('.dropAccounts');
            }

        });

        return grpAccContainer;
    },
    dropObject: function (strTargetGroupId) {
        var objClone, objOriginal, objTarget, objEmpty, objBands, objItem;

        drag.removePopup();
        strTargetIDgrp = drag.findGroup(strTargetGroupId);
        strTarget = $(strTargetIDgrp).attr('id')

        if (window.strTarget !== undefined && strTarget.length > 0) {
            // Copy node to new target
            objOriginal = drag.objCurrent;
            objClone = drag.objCurrent.cloneNode(true);

            // Remove previous attributes
            $(objClone).removeAttr('onkeypress');
            $(objClone).removeAttr('aria-haspopup');
            $(objClone).removeAttr('role');
            $(objClone).removeAttr('aria-owns');
            $(objClone).removeClass('ui-draggable');
            $(objClone).removeClass('accountDrop');
            $(objClone).removeClass('hover');
            $(objClone).addClass('groupAcc');
            $(objClone).addClass('ui-droppable');
            $(objClone).children().eq(0).removeClass('col-xs-9');
            $(objClone).children().eq(0).addClass('col-xs-7');
            $(objClone).children().eq(2).addClass('orderDivAccount');
            objClone.removeAttribute('style');
            objClone.className = objClone.className.replace(/\s*focused/, '');
            objClone.className = objClone.className.replace(/\s*hover/, '');

            // Add focus indicators
            objClone.onfocus = function () { this.className += ' focused'; };
            objClone.onblur = function () { this.className = this.className.replace(/\s*focused/, ''); };
            objClone.onmouseover = function () { if (this.className.indexOf('hover') < 0) { this.className += ' hover'; } };
            objClone.onmouseout = function () { this.className = this.className.replace(/\s*hover/, ''); };
            objTarget = document.getElementById(strTarget);
            objTarget = $(objTarget).children('.sort');
            $(objTarget).append(objClone);

            $(objClone).find(".icons").toggleClass("hidden").siblings(".accountOrder").children().val($(objClone).find(".accountDrop").length - 1);;
            $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");
            drag.deleteAndOrderAccountEvent(objClone);
            drag.objCurrent = objClone;

            //focus on target group and expand if is collapsed
            var groupToFocus = $(strTargetIDgrp).siblings('.groupInfo');
            $(groupToFocus).focus();   
          
            if ($(groupToFocus).siblings('.dropAccounts').css('display') == 'none') {
                $(groupToFocus).siblings('.dropAccounts').slideDown();
                $(groupToFocus).children().eq(0).children().eq(0).toggleClass('hidden');
                $(groupToFocus).children().eq(0).children().eq(1).toggleClass('hidden');
            }
           
            drag.end;
        } else {
            drag.objCurrent.focus();
        }
        // Reset properties
        drag.objCurrent.style.left = '0px';
        drag.objCurrent.style.top = '0px';

        drag.objCurrent.style.zIndex = 'auto';
        drag.objCurrent.setAttribute('aria-grabbed', 'false');
        drag.objCurrent.removeAttribute('aria-owns');

        drag.identifyTargets(false);
    },
    
    deleteAndOrderAccountEvent: function (obj) {
        $(obj).find('.deleteAccount').on("click", function () {
            $(this).parents(".groupAcc").remove();
            $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");
        });

        $(obj).find('.deleteAccount').on("keypress", function () {
            if (event.keyCode == "13") {
                $(this).parents(".groupAcc").remove();
                $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");

            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        });
        var orderelem = $(obj).find('.order');
        $(orderelem).attr('arial-label', top.eBankit.Presentation.GetResource("TRX01802OrderButtonAltText")); 
        $(orderelem).attr('title', top.eBankit.Presentation.GetResource("TRX01802OrderButtonAltText"));
        $(orderelem).attr('alt', top.eBankit.Presentation.GetResource("TRX01802OrderButtonAltText"));
        $(orderelem).attr('tabindex', '0');
        $(orderelem).attr('onkeypress', keyboarAccountsSortable($(orderelem).attr('id')));
        $(orderelem).attr('onkeydown', keyboarAccountsSortable($(orderelem).attr('id')));

        $(obj).find('.order').on("onkeypress", function () {           
            keyboarAccountsSortable($(orderelem).attr('id'));   
        });
    },

    end: function () {
        var strTarget = drag.getTarget();
        drag.dropObject(strTarget);
        document.onmousemove = null;
        document.onmouseup = null;
        drag.objCurrent = null;
    },

    verifyAccountInGroups: function (accountNumber) {
        var GroupsContainer = $('#dragGroups');
        var findAccountInGroupArray = [];
        var groupsContainer = $(GroupsContainer).find('.dropAccounts');
        $(groupsContainer).each(function () {
            var accCont = $(this).find('.accountDetailsNumber');
            $(accCont).each(function () {
                var acc = $(this).text().trim();
                if (accountNumber === acc) {                    
                    var groupId = $(this).parent().parent().parent().parent().siblings('input').eq(0).val()
                    findAccountInGroupArray.push(groupId);
                }
            });

        });

        return findAccountInGroupArray;
    }
};

function keyboardDragDropEvent(elem) {

    var groupNamesIDs = hdnGroupNamesIDs.val();
    var objItems = getElementsByClassName(document, 'div', 'ui-draggable');
    var objItem, iCounter;
    hdnCurrentAccSelected.val($(elem).find('.accountNumber').text());

    for (iCounter = 0; iCounter < objItems.length; iCounter++) {
        // Set initial values so can be moved
        objItems[iCounter].style.top = '0px';
        objItems[iCounter].style.left = '0px';

        // Put the list items into the keyboard tab order
        objItems[iCounter].tabIndex = 0;

        // Set ARIA attributes for artists
        objItems[iCounter].setAttribute('aria-grabbed', 'false');
        objItems[iCounter].setAttribute('aria-haspopup', 'true');
        

        // Provide a focus indicator			
        objItems[iCounter].onfocus = function () { this.className += ' focused'; };
        objItems[iCounter].onblur = function () { this.className = this.className.replace(/\s*focused/, ''); };
        objItems[iCounter].onmouseover = function () { if (this.className.indexOf('hover') < 0) { this.className += ' hover'; } };
        objItems[iCounter].onmouseout = function () { this.className = this.className.replace(/\s*hover/, ''); };
        drag.initialise(objItems[iCounter]);
    }

    //// Set ARIA properties on the drag and drop list, and set role of this region to application
    //for (iCounter = 0; iCounter < drag.arTargets.length; iCounter++) {
    //	objItem = document.getElementById(drag.arTargets[iCounter]);
    //	//objItem.setAttribute('aria-labelledby', drag.arTargets[iCounter] + 'h');
    //	objItem.setAttribute('role', 'list');
    //}

    //objItem = document.getElementById('dragdrop');
    //objItem.setAttribute('role', 'application');


    //objItems = null;

}