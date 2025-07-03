from flask import Flask, render_template, request, redirect, url_for, session, flash
import mysql.connector
from datetime import datetime

app = Flask(__name__)
app.secret_key = '1234'

# MySQL connection
def get_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="Qwerty123$%",
        database="student_db"
    )

# --- ROUTES ---

# Welcome page
@app.route('/')
def welcome():
    return render_template('welcome.html')

# Admin login
@app.route('/login_admin', methods=['GET', 'POST'])
def login_admin():
    if request.method == 'POST':
        if request.form['username'] == 'admin' and request.form['password'] == 'admin':
            session.clear()
            session['admin'] = True
            return redirect(url_for('index'))
        flash('Invalid credentials', 'danger')
    return render_template('login_admin.html')

# Guest login
@app.route('/login_guest', methods=['GET', 'POST'])
def login_guest():
    if request.method == 'POST':
        session.clear()
        session['guest'] = True
        return redirect(url_for('index'))
    return render_template('login_guest.html')

# Logout (for both)
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('welcome'))

# Dashboard: list & add students
@app.route('/index', methods=['GET', 'POST'])
def index():
    # must be logged in
    if not session.get('admin') and not session.get('guest'):
        return redirect(url_for('welcome'))

    db = get_db()
    cursor = db.cursor(dictionary=True)

    # Admin adding a student
    if request.method == 'POST' and session.get('admin'):
        # collect form
        name        = request.form['name']
        gender      = request.form['gender']
        age         = request.form['age']
        cls         = request.form['class']
        section     = request.form['section']
        roll_no     = request.form['roll_no']
        attendance  = request.form['attendance']
        marks       = request.form['marks']
        student_id  = f"{cls}{section}{int(roll_no):03d}"
        # insert
        cursor.execute("""
            INSERT INTO students
            (name, gender, age, class, section, roll_no, student_id, attendance, marks)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)
        """, (name, gender, age, cls, section, roll_no, student_id, attendance, marks))
        db.commit()

    # fetch students
    cursor.execute("SELECT * FROM students")
    students = cursor.fetchall()
    db.close()

    return render_template('index.html',
        students=students,
        is_admin = session.get('admin', False),
        is_guest = session.get('guest', False)
    )

# Edit student (admin only)
@app.route('/edit/<int:id>', methods=['GET','POST'])
def edit(id):
    if not session.get('admin'):
        return redirect(url_for('index'))

    db = get_db()
    cursor = db.cursor(dictionary=True)

    if request.method == 'POST':
        # collect form
        name        = request.form['name']
        gender      = request.form['gender']
        age         = request.form['age']
        cls         = request.form['class']
        section     = request.form['section']
        roll_no     = request.form['roll_no']
        attendance  = request.form['attendance']
        marks       = request.form['marks']
        student_id  = f"{cls}{section}{int(roll_no):03d}"
        # update
        cursor.execute("""
            UPDATE students SET
            name=%s, gender=%s, age=%s, class=%s, section=%s,
            roll_no=%s, student_id=%s, attendance=%s, marks=%s
            WHERE id=%s
        """, (name,gender,age,cls,section,roll_no,student_id,attendance,marks,id))
        db.commit()
        db.close()
        return redirect(url_for('index'))

    # GET: show form
    cursor.execute("SELECT * FROM students WHERE id=%s", (id,))
    student = cursor.fetchone()
    db.close()
    return render_template('edit.html', student=student)

# Delete student (admin only)
@app.route('/delete/<int:id>')
def delete(id):
    if session.get('admin'):
        db = get_db()
        cursor = db.cursor()
        cursor.execute("DELETE FROM students WHERE id=%s", (id,))
        db.commit()
        db.close()
    return redirect(url_for('index'))


# Notifications (public)
@app.route('/notifications')
def notifications():
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM notifications ORDER BY created_at DESC")
    notes = cursor.fetchall()
    db.close()
    return render_template('notifications.html', notifications=notes)

# Edit notifications (admin only)
@app.route('/edit_notifications', methods=['GET','POST'])
def edit_notifications():
    if not session.get('admin'):
        return redirect(url_for('welcome'))

    db = get_db()
    cursor = db.cursor(dictionary=True)

    if request.method == 'POST':
        title      = request.form['title']
        message    = request.form['message']
        created_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        cursor.execute(
            "INSERT INTO notifications (title,message,created_at) VALUES (%s,%s,%s)",
            (title,message,created_at)
        )
        db.commit()

    cursor.execute("SELECT * FROM notifications ORDER BY created_at DESC")
    notes = cursor.fetchall()
    db.close()
    return render_template('edit_notifications.html', notifications=notes)

# Delete notification
@app.route('/delete_notification/<int:id>')
def delete_notification(id):
    if session.get('admin'):
        db = get_db()
        cursor = db.cursor()
        cursor.execute("DELETE FROM notifications WHERE id=%s", (id,))
        db.commit()
        db.close()
    return redirect(url_for('edit_notifications'))


if __name__ == '__main__':
    app.run(debug=True)
