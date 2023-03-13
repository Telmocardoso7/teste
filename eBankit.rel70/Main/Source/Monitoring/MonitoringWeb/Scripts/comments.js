Array.prototype.remove = function (from, to) {
    if (typeof from != "number") return this.remove(this.indexOf(from));
    var rest = this.slice((to || from) + 1 || this.length);
    this.length = from < 0 ? this.length + from : from;
    return this.push.apply(this, rest);
};

jQuery(function ($) {

    var el = document.getElementById("blocks");
    var p = Processing(el);

    var maxColumns = 80;
    var rows = 60;
    var width = el.width;
    var height = el.height;
    var frameRate = 100;
    var speed = 1; // average # of comments per second
    var skip = 0; // skip the first stuff
    var font = p.loadFont("Helvetica");

    var defaultFontSize = 12; // scaling affects this size

    var columns = [];
    var components = [];
    var titles = [];

    var Random = function Random() {
        var haveNextNextGaussian = false;
        var nextNextGaussian;

        return {
            nextGaussian: function () {
                if (haveNextNextGaussian) {
                    haveNextNextGaussian = false;
                    return nextNextGaussian;
                } else {
                    // use Box-Muller transformation, as described by Knuth
                    var v1, v2, s;
                    do {
                        v1 = 2 * Math.random() - 1;   // between -1.0 and 1.0
                        v2 = 2 * Math.random() - 1;   // between -1.0 and 1.0
                        s = v1 * v1 + v2 * v2;
                    } while (s >= 1 || s == 0);
                    var multiplier = Math.sqrt(-2 * Math.log(s) / s);
                    nextNextGaussian = v2 * multiplier;
                    haveNextNextGaussian = true;
                    return v1 * multiplier;
                }
            }
        };
    };

    var authors = 15;
    var Block = function Block(column, author) {
        var pos = 0;

        var shownAuthor = false;
        var authorPos = authors--;
        if (authors <= 0)
            authors = 15;

        return {
            update: function () {
                if (column.count() >= rows) {
                    Reset(); // Top reached - clean;
                }

                if (pos < rows - column.count()) {
                    pos++;
                } else {
                    components.remove(this);
                    column.increment();
                }
                if (!shownAuthor && column.getY(pos) > authorPos * defaultFontSize + height / 8) {
                    components.push(new Author(author, column, authorPos));
                    shownAuthor = true;
                }
            },

            draw: function () {
                var x1 = column.getX(column.col());
                var y1 = column.getY(pos);
                var x2 = column.getX(column.col() + 1) - 1;
                var y2 = column.getY(pos + 1);
                p.fill(0, 0, 255);
                p.rect(x1, y1, x2 - x1, y2 - y1);
            }
        };
    };

    var Author = function Author(name, column, pos) {
        function fade(age) {
            var y = -1 / 120 * (age + 95) * (age - 255);
            return Math.max(Math.min(y, 255), 0);
        }

        var age = 0;
        var maxAge = 100;
        var col = column.col();
        return {
            update: function () {
                age++;
                if (age > maxAge) components.remove(this);
            },
            draw: function () {

                p.textFont(font, defaultFontSize);
                var x1 = column.getX(col) - font.width(name) * defaultFontSize * col / columns.length;
                var y1 = pos * defaultFontSize + height / 8;
                p.fill(0, 0, 255, fade(age / 100 * 255));
                p.text(name, x1, y1);
            }
        };
    };

    function columnColor(count) {
        return {
            h: Math.min(count + 70, 120),
            s: Math.min(64 + count * 8, 192),
            b: Math.min(128 + count * 8, 255)
        };
    }

    var Column = function Column(page) {
        var scale = width / maxColumns;
        var count = 0; // comments which have finished falling
        var flare = 0;
        var maxFlare = 100;
        var col = 0;

        var result = {
            setCol: function (c) {
                col = c;
            },

            col: function () {
                return col;
            },

            getX: function (col) {
                var offset = (maxColumns - columns.length) * scale;
                return Math.floor(col * scale + offset);
            },

            getY: function (row) {
                return Math.floor(row * height * 0.70 / rows);
            },

            count: function () {
                return count;
            },

            increment: function () {
                count++;
                flare = maxFlare;
                if (titles.indexOf(page.title) < 0)
                    components.push(new PageTitle(this, page.title, columnColor(count)));
            },

            color: function () {
                var baseColor = columnColor(count);
                return {
                    h: baseColor.h,
                    s: Math.max(baseColor.s - (baseColor.s * flare / maxFlare), 0),
                    b: baseColor.b + (255 - baseColor.b) * flare / maxFlare
                };
            },

            update: function () { },

            draw: function () {
                var color = this.color();
                p.fill(color.h, color.s, color.b);
                var x1 = this.getX(col);
                var y1 = this.getY(rows - count + 1);
                var x2 = this.getX(col + 1) - 1;
                var y2 = this.getY(rows + 3);
                p.rect(x1, y1, x2 - x1, y2 - y1);
                if (flare > 0) flare--;
            },

            page: page
        };

        page.column = result;
        return result;
    };

    var PageTitle = function PageTitle(column, title) {
        var fontSize = 14;
        var result = {
            update: function () {
                if (titles.indexOf(title) < 0)
                    components.remove(this);
            },
            draw: function () {
                var pos = titles.indexOf(title);
                if (pos < 0) return;
                var color = column.color();
                p.fill(color.h, color.s, color.b);
                p.textFont(font, fontSize);
                var col = column.col();
                var x = column.getX(col) - font.width(title) * fontSize * col / columns.length;
                var y = height * 0.75 + pos * fontSize + fontSize;
                p.text(title, x, y);
            }
        };
        titles.unshift(title);
        if (titles.length > 7) titles.pop();
        return result;
    };

    var Background = function Background(alpha) {
        return {
            update: function () { },
            draw: function () {
                p.background(0, alpha);
            }
        };
    };
    components.push(new Background(96));

    p.size(width, height);
    p.fill(0);
    p.noStroke();
    p.colorMode(p.HSB);

    function addColumn(page) {
        var column = new Column(page);
        columns.push(column);
        components.push(column);
        if (columns.length > maxColumns) {
            var c = columns.shift();
            c.page.hidden = true;
            components.remove(c);
        }
    }

    var pauseMessage = {
        size: 20,
        update: function () { },
        draw: function () {
            p.textFont(font, this.size);
            p.fill(0, 0, 192);
            p.text("Paused", width / 2 - font.width("Paused") * this.size / 2, this.size * 1.5);
        }
    };

    function run(comments, pages) {
        var pagesToAdd = [];
        var scomments3 = [];
        var frames = 1 * frameRate / speed;
        var rnd = new Random();
        var mindate = new Date().getTime();
        showStartDate(new Date(mindate));
        var maxdate = new Date().getTime();
        var datedelta = (maxdate - mindate) / frames;
        var frame = 0;

        for (var i = 0; i < maxColumns; i++) {
            addColumn({});
        }
        //for (var id in pages) {
        //    var page = pages[id];
        //    if (page.date.getTime() <= mindate) {
        //        addColumn(page);
        //    } else {
        //        pagesToAdd.push(page);
        //    }
        //}
        //pagesToAdd.sort(function (a, b) {
        //    return a.date.getTime() < b.date.getTime() ? -1 :
        //      (a.date.getTime() > b.date.getTime() ? 1 : 0);
        //});

        var interval;
        var firstDate = new Date();
        var lastDAte = new Date();
        var diffMs = (lastDAte - firstDate);
        var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
        var control = 0;


        var runner = function () {
            frames = GlobalBuffer.length * frameRate / speed;

            if (GlobalBuffer.length == 0)
                control == 0

            if (control == 0 && GlobalBuffer.length > 0) {
                var tempDate = GlobalBuffer[0].date.getTime();
                var c = GlobalBuffer.shift();
                if (typeof columns[GlobalDictionary[c.title]] == "undefined") { // some columns are created *after* their comments (!)
                    AddTransactionPage(c);
                }
                if (typeof columns[GlobalDictionary[c.title]] != "undefined") { // only take values in range
                    var b = new Block(columns[GlobalDictionary[c.title]], c.author);
                    components.push(b);
                }
                if (GlobalBuffer.length > 0)
                    control = Math.abs(GlobalBuffer[0].date.getTime() - tempDate);
            }

            if (control > 0)
                control = Math.abs(control - 10);  // 1000 / frameRate  = 10  from -> interval = window.setInterval(runner, Math.floor(1000 / frameRate));

            showCurrentDate(new Date());

            for (var i = 0; i < columns.length; i++) {
                columns[i].setCol(i);
            }

            for (var i = 0; i < components.length; i++) {
                components[i].update();
            }
            if (frame > frames * skip) {
                for (var i = 0; i < components.length; i++) {
                    components[i].draw();
                }
            }
            frame++;
        };

        function AddTransactionPage(page) {
            var next = GlobalDictionary["NextId"];
            if (next < 80) {
                GlobalDictionary[page.page] = next;
                columns[next].page.title = page.title;
            }
            else {
                Reset(); // Horizontal limit reached - clean;
            }
            GlobalDictionary["NextId"] = GlobalDictionary["NextId"] + 1;
        }


        interval = window.setInterval(runner, Math.floor(1000 / frameRate));
        $("#blocks").toggle(function () {
            window.clearInterval(interval);
            components.push(pauseMessage);
            runner(); // run once to display the pause message
        }, function () {
            components.remove(pauseMessage);
            interval = window.setInterval(runner, Math.floor(1000 / frameRate));
        });
    }

    function randomIntFromInterval(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }

    function formatDate(date) {
        var d = date.getDate();
        d = "" + (d < 10 ? "0" : "") + d + " ";
        d += "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split(/ /)[date.getMonth()] + " ";
        d += date.getFullYear();
        d = "Sun Mon Tue Wed Thu Fri Sat".split(/ /)[date.getDay()] + " " + d;
        return d;
    }

    function formatTime(date) {
        var h = date.getHours();
        var ampm = h >= 12 ? "PM" : "AM";
        var t = "" + (h == 0 ? 12 : (h > 12 ? h - 12 : h)) + ":";
        var m = date.getMinutes();
        t += "" + (m < 10 ? "0" : "") + m + " " + ampm;
        return t;
    }

    function showStartDate(date) {
        $(".start .date").text(formatDate(date));
        $(".start .time").text(formatTime(date));
    }

    function showCurrentDate(date) {
        $(".current .date").text(formatDate(date));
        $(".current .time").text(formatTime(date));
    }

    function drawScale(el) {
        var p = Processing(el);
        p.size(el.width, el.height);
        p.colorMode(p.HSB);
        p.noStroke();
        for (var i = 0; i < 50; i++) {
            var color = columnColor(i);
            p.fill(color.h, color.s, color.b);
            p.rect(i * 2 + 70, 0, 5, 14);
        }
        var font = p.loadFont("Helvetica");
        p.textFont(font, 11);
        p.fill(0, 0, 255);
        p.text("Transactions", 0, 12);
        p.text("0", 70, 26);
        p.text("50+", 130, 26);
    }
    drawScale(document.getElementById("scale"));

    function parseDate(isoDateString) {
        var d = isoDateString.split(/[: -]/);
        return new Date(Date.UTC(d[0], d[1] - 1, d[2], d[3], d[4], d[5]));
    }

    $(document).ready(function () {
        run(null, null);
        setInterval(function () {
            Reset();
        }, 300000); // 5 min
    });

    var Reset = function () {
        titles = [];
        GlobalDictionary = {};
        GlobalDictionary["NextId"] = 0;
        run(null, null);
    }
});



var GlobalBuffer = [];
var GlobalDictionary = {};
GlobalDictionary["NextId"] = 0;