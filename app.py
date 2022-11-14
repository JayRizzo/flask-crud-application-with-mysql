from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
from flask import url_for
from flask import flash
from flaskext.mysql import MySQL

app = Flask(__name__)
app.secret_key = 'Random Genius Pitchshifter Bytes!'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'YourPassword!'
app.config['MYSQL_DATABASE_DB'] = 'crud'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql = MySQL(app)

# =============================================================================
# BEGIN - Defining the Routes Of our Website
# =============================================================================
@app.route('/')
def Index():
    conn    = mysql.connect()   # Initialize Connection
    cursor  = conn.cursor()     # Initialize Query Execution Handler
    cursor.execute("SELECT id, name, email, phone FROM students")
    data = cursor.fetchall()
    print(data)
    cursor.close()
    return render_template('index.html', students=data )

@app.route('/insert', methods = ['POST'])
def insert():
    if request.method == "POST":
        name    = request.form['name']
        email   = request.form['email']
        phone   = request.form['phone']
        conn    = mysql.connect()   # Initialize Connection
        cursor  = conn.cursor()     # Initialize Query Execution Handler
        cursor.execute("INSERT INTO students (name, email, phone) VALUES (%s, %s, %s)", (name, email, phone))
        conn.commit()
        conn.close()
        flash(f"Data Inserted Successfully For: {name}")
        return redirect(url_for('Index'))

@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
    conn    = mysql.connect()   # Initialize Connection
    cursor  = conn.cursor()     # Initialize Query Execution Handler
    cursor.execute("DELETE FROM students WHERE id=%s", (id_data,))
    conn.commit()
    conn.close()
    flash(f"Record {id_data} Has Been Deleted Successfully")
    return redirect(url_for('Index'))

@app.route('/update',methods=['POST','GET'])
def update():
    if request.method == 'POST':
        id_data = request.form['id']
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        conn    = mysql.connect()   # Initialize Connection
        cursor  = conn.cursor()     # Initialize Query Execution Handler
        cursor.execute("""
               UPDATE students
               SET name=%s, email=%s, phone=%s
               WHERE id=%s
            """, (name, email, phone, id_data))
        flash(f"Data Updated Successfully for {name}")
        conn.commit()
        conn.close()
        return redirect(url_for('Index'))

if __name__ == "__main__":
    app.run(debug=True)
