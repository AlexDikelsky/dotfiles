fn main() {
    let a = vec!['0', '1', '2', '3', '4', '5'];
    //print_dice(&a);
    dbg!(sides_with_front(&a, 4, 0));
    dbg!(sides_with_front(&a, 4, 1));
    dbg!(sides_with_front(&a, 4, 2));
    dbg!(sides_with_front(&a, 4, 3));
    //dbg!("{}", get_sides(vec!['0', '1', '2', '3', '4', '5'], 2));
    //dbg!("{}", get_sides(vec!['0', '1', '2', '3', '4', '5'], 0));
}

fn print_dice(dice: &Vec<char>) {
    assert!(dice.len() == 6);
    let inside = "     ";
    let left_right = "+-----";
    let half = &inside[0..(inside.len()/2)];

    // Top part
    println!("{} {}+", inside, left_right);
    println!("{} |{}{}{}|", inside, half, dice[4], half);

    //Middle part
    println!("{}{}{}{}+", left_right, left_right, left_right, left_right);
    for x in 0..4 {
        print!("|{}{}{}", half, dice[x], half);
    }
    println!("|");
    println!("{}{}{}{}+", left_right, left_right, left_right, left_right);

    //Bottom part
    println!("{} |{}{}{}|", inside, half, dice[5], half);
    println!("{} {}+", inside, left_right);
}

fn sides_with_front(dice: &Vec<char>, top: usize, front: usize) -> Vec<char> {
    let sides = get_sides(&dice, top);
    //dbg!(sides);
    let index = sides.iter().position(|&x| x == dice[front]);
    //dbg!(index);
    match index {
        Some(ind) => (0..4).map(|x| sides[(ind + x) % 4]).collect(),
        None => panic!("Attempted to pick a frount that is not in sides"),
    }
}
    

fn get_sides(dice: &Vec<char>, top: usize) -> Vec<char> {
    match top {
        0 => get_sides(dice, 2).iter().rev().map(|x| *x).collect(),
        1 => get_sides(dice, 3).iter().rev().map(|x| *x).collect(),
        2 => vec![dice[1], dice[5], dice[3], dice[4]],
        3 => vec![dice[0], dice[4], dice[2], dice[5]],
        4 => vec![dice[0], dice[1], dice[2], dice[3]],
        5 => get_sides(dice, 4).iter().rev().map(|x| *x).collect(),
        _ => panic!("Top called on an invalid number"),
    }
}


